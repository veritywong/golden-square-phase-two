def check_todo(text)
    fail "Nothing on the list." if text.empty?
    if text.include?("TODO")
        return true
    else
        return false
    end
end