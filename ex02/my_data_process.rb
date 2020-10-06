def my_data_process(csv_processed)
    header = csv_processed[0].split(',')
    body = csv_processed[1..csv_processed.length-1]
    group = ["Gender","Email","Age","City","Device","Order At"]
    index = 0
    hash = {}
    header.each{|key|
        if(group.include?(key))
            col = []
            body.each{|val| 
                col << val.split(',')[index]
            }
            # content = {}
            # col.each{|val| content[val] =+ 1}
            hash[key] = col.group_by(&:itself).transform_values(&:count)
        end
        index +=1
    }
    return hash
end 
