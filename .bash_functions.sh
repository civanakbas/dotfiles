cp_alias() {
    alias_name="$1"  
    alias_command=$(alias "$alias_name" 2>/dev/null)  

    if [ -n "$alias_command" ]; then

        alias_value="${alias_command#*=}"
        alias_value="${alias_value%\'*}"
        alias_value="${alias_value#\'*}"

        echo -n "$alias_value" | xclip -selection clipboard

        echo "Alias value copied to clipboard:"
        echo "$alias_value"
    else
        echo "Alias '$alias_name' not found."
    fi
}

