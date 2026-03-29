#!/bin/bash

# Ciphertext
CIPHERTEXT_RAW="LLGVFHAIUIWPSAVBRXVIHCEIKXCHUEJHUZFVKIEOIMLCXUICIYKNVETMVZISESPYZRVY
UNICLSCHFXZITUEHVMHZVVOMNXCCXVQGFRWGQOEXJCVIRRGXJYIEFIZUDTDIQZKLAW
KMKLWHKZWIJIPWVMFHCNRTJMXUTCDEYMSILAGYEXZIWHZXWHUNRXWWCHUXZIGOIS
HICHLRASPIIKSRKTRXASPMKLSXQJVVSXGACSTENFPRWIFNFXSOGWRVWXJUKXZIALVRG
XXCFPSXKHXEFCUOTLDEYMNLAPGWFRVYENZRYFWMZRWWUQYIFMPXFYTXEIEWMPVFV
KSPEILRKINVVJGVGUTXARIMFQWFQXZIKSHFRAGVTYXYDEVCFRKHQNICLSFYWMFIYBRX
KIEOIIEICHJSJEVFVEKXUIDIGJVBVWLIRMPSMWJILPVXCEVXGFGMVGMVGYESMKJNYIHEA
GVRLGCLUMFHWMKVQHCNRWWGWLZXQWVUEHSVFJTMVWUUGTDMGMKSUSOJRRAIU
NYELTTITIKWELVHAXEUIHHEAGVRLWVBVLWENNYMFWWLRRUIRIIXSFKFZXQEPXRGUS
WHKETMNCKCSGVIW1996LATCUZWXSTIIKSRKTRXASPMKLSXJUEHDIJYRPLLEUIISRFJRX
AIPNIIUSTXJXZIHYUIJENCEJGVOUKMGRUYTYJMVSDEFEIYDIFXCWKJAWOUUIXMPYJWW
GWLZXQWVUEHSVFMWSJQCHPJWHGLRPSKGHTMWWKHKLWYPCKIVWVUKIKEPXKLWVG
UIISLQMKSXSVBVVKAJYKLWVVBVWWWVUEHSVFMRVWIHZVGLMXYZWVIDUKETPGVLX
XSNFFAARINYIKIEOIMLCUNRRVETXJHWJKHVHXSTNYIARFOJXJCKHNLAGJSFYJIQJVVSXK
HXMKEFPZWSFNYZJFSVGRRVEVYU"

# clean text
clean_text() {
    echo "$1" | tr -d -c 'A-Za-z' | tr '[:lower:]' '[:upper:]'
}

# decrypt vigenère (simple implementation)
decrypt_vigenere() {
    local cipher="$1"
    local key="$2"
    local result=""
    local keylen=${#key}
    local cipherlen=${#cipher}
    
    for ((i=0; i<cipherlen; i++)); do
        # get cipher character and key character
        local c="${cipher:$i:1}"
        local k="${key:$((i % keylen)):1}"
        
        # Convert to numbers (A=0)
        local c_num=$(($(printf '%d' "'$c") - 65))
        local k_num=$(($(printf '%d' "'$k") - 65))
        
        # Decrypt: (C - K) mod 26
        local p_num=$(((c_num - k_num + 26) % 26))
        
        # Convert back to character
        local p_char=$(printf "\x$(printf '%x' $((p_num + 65)))")
        result="${result}${p_char}"
    done
    
    echo "$result"
}

# IC calculation
calc_ic() {
    local text="$1"
    local len=${#text}
    
    if [ $len -le 1 ]; then
        echo "0"
        return
    fi
    
    # count frequencies
    declare -A freq
    for ((i=0; i<len; i++)); do
        local c="${text:$i:1}"
        freq[$c]=$((${freq[$c]:-0} + 1))
    done
    
    # Calculate IC
    local sum=0
    for f in "${freq[@]}"; do
        sum=$((sum + f * (f - 1)))
    done
    
    echo "scale=6; $sum / ($len * ($len - 1))" | bc
}

# chi-squared (simplified)
chi_squared() {
    local text="$1"
    local len=${#text}
    
    # english frequencies (scaled by 100)
    declare -A eng_freq=([E]=127 [T]=91 [A]=82 [O]=75 [I]=70 [N]=67 [S]=63 [H]=61 [R]=60 [D]=43 [L]=40 [C]=28 [U]=28 [M]=24 [W]=24 [F]=22 [G]=20 [Y]=20 [P]=19 [B]=15 [V]=10 [K]=8 [J]=2 [X]=2 [Q]=1 [Z]=1)
    
    declare -A freq
    for ((i=0; i<len; i++)); do
        local c="${text:$i:1}"
        freq[$c]=$((${freq[$c]:-0} + 1))
    done
    
    local chi2=0
    for letter in {A..Z}; do
        local expected=$((${eng_freq[$letter]:-1} * len / 100))
        local observed=${freq[$letter]:-0}
        if [ $expected -gt 0 ]; then
            local diff=$((observed - expected))
            chi2=$((chi2 + diff * diff * 100 / expected))
        fi
    done
    
    echo $chi2
}

# crack caesar
crack_caesar() {
    local text="$1"
    local len=${#text}
    local best_shift=0
    local best_score=9999999
    
    for ((shift=0; shift<26; shift++)); do
        local decrypted=""
        for ((i=0; i<len; i++)); do
            local c="${text:$i:1}"
            local num=$(($(printf '%d' "'$c") - 65))
            local new_num=$(((num - shift + 26) % 26))
            decrypted="${decrypted}$(printf "\x$(printf '%x' $((new_num + 65)))")"
        done
        
        local score=$(chi_squared "$decrypted")
        if [ $score -lt $best_score ]; then
            best_score=$score
            best_shift=$shift
        fi
    done
    
    echo $best_shift
}

# main
main() {
    echo "================================================================================"
    echo "================================================================================"
    
    CIPHERTEXT=$(clean_text "$CIPHERTEXT_RAW")
    echo "ciphertext length: ${#CIPHERTEXT} characters"
    echo ""
    
    # test key lengths with index test
    echo "index of coincidence test"
    echo "================================================================================"
    
    for keylen in {1..20}; do
        declare -a groups
        for ((i=0; i<keylen; i++)); do
            groups[$i]=""
        done
        
        for ((i=0; i<${#CIPHERTEXT}; i++)); do
            groups[$((i % keylen))]+="${CIPHERTEXT:$i:1}"
        done
        
        local total_ic=0
        for ((i=0; i<keylen; i++)); do
            if [ ${#groups[$i]} -gt 1 ]; then
                local ic=$(calc_ic "${groups[$i]}")
                total_ic=$(echo "$total_ic + $ic" | bc)
            fi
        done
        
        local avg_ic=$(echo "scale=6; $total_ic / $keylen" | bc)
        local marker=""
        if (( $(echo "$avg_ic > 0.060" | bc -l) )) && [ $keylen -gt 1 ]; then
            marker=" ← likely"
        fi
        printf "  key length %2d: ic = %s%s\n" $keylen "$avg_ic" "$marker"
    done
    
    # use key length 12
    KEY_LENGTH=12
    
    echo ""
    echo "frequency analysis (key length = $KEY_LENGTH)"
    echo "================================================================================"
    
    # split into groups
    declare -a groups
    for ((i=0; i<KEY_LENGTH; i++)); do
        groups[$i]=""
    done
    
    for ((i=0; i<${#CIPHERTEXT}; i++)); do
        groups[$((i % KEY_LENGTH))]+="${CIPHERTEXT:$i:1}"
    done
    
    # crack each position
    KEYWORD=""
    for ((i=0; i<KEY_LENGTH; i++)); do
        shift=$(crack_caesar "${groups[$i]}")
        letter=$(printf "\x$(printf '%x' $((shift + 65)))")
        KEYWORD="${KEYWORD}${letter}"
        printf " position %2d: shift=%2d, letter='%s'\n" $((i+1)) $shift "$letter"
    done
    
    echo ""
    echo "****************************************"
    echo "keyword: $KEYWORD"
    echo "****************************************"
    
    # decrypt
    echo ""
    echo "decryption"
    echo "================================================================================"
    
    PLAINTEXT=$(decrypt_vigenere "$CIPHERTEXT" "$KEYWORD")
    
    echo "plaintext:"
    echo "--------------------------------------------------------------------------------"
    
    # format with line breaks
    for ((i=0; i<${#PLAINTEXT}; i+=70)); do
        echo "${PLAINTEXT:$i:70}"
    done
    
    echo "--------------------------------------------------------------------------------"
    echo ""
    echo "================================================================================"
    echo "key length: $KEY_LENGTH"
    echo "keyword: $KEYWORD"
    echo "plaintext length: ${#PLAINTEXT} characters"
    echo "================================================================================"
}

main
