def validate_input10(isbn_num)
 
    new_isbn = isbn_num.delete(' -')  

    return false if new_isbn.length != 10
            
    isbn_check = new_isbn[0..8]
    isbn_checksum = new_isbn[9]

    if isbn_check.count("^0-9").zero? && isbn_checksum.count("^0-9xX").zero?
        checksum_10(isbn_num)
#       return true         ## this was initial test just to validate correctly formatted number
    else
        return false
    end

end

def checksum_10(isbn_num)

    new_isbn = isbn_num.delete(' -')  # Remove authorized hyphen and space characters

#  Split input to address first 9 characters separate from final checksum   
    isbn_check = new_isbn[0..8]
    isbn_num_array = isbn_check.split('').map(&:to_i)

# Calculate valid checksum from first 9 characters
    sum = 0
    position = 1

    isbn_num_array.each do |calc_checksum|
        sum += calc_checksum*position
        position += 1
    end

    checksum = sum % 11

# Split input to address 10th character as checksum
    isbn_checksum = new_isbn[9]
    if isbn_checksum == 'x' || isbn_checksum == 'X'
        checksum_value = 10
    else
        checksum_value = isbn_checksum.to_i
    end

# Check if calculated checksum matches checksum value from input
    if checksum == checksum_value
        return true
    else
        return false
    end 

end

########## ISBN 13 ##########


def validate_isbn?(num)
    new_isbn = isbn_num.delete(' -')  # Remove authorized hyphen and space characters

    return false if new_isbn.length != 13
            
    if new_isbn.count("^0-9").zero?
        checksum_13(isbn_num)
    else
        return false
    end

end

def checksum_13(isbn_num)

    new_isbn = isbn_num.delete(' -')  # Remove authorized hyphen and space characters

#  Split input to address first 12 characters separate from final checksum  
    isbn_check = new_isbn[0..11]

    isbn_num_array = isbn_check.split('').map(&:to_i)

# Calculate valid checksum from first 12 characters
    position = 1
    sum = 0

    isbn_num_array.each do |calc_checksum|
        if position.even?
            sum += calc_checksum*3
        else
            sum += calc_checksum*1
        end
        position += 1
    end

    checksum = (10 - sum % 10) % 10

    isbn_checksum = new_isbn[12]
    checksum_value = isbn_checksum.to_i

# Check if calculated checksum matches checksum value from input
    if checksum == checksum_value
        return true
    else
        return false
    end 

end


