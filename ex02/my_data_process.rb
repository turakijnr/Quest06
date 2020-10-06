require 'json'
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
    return hash.to_json
end 

#puts my_data_process (["Gender,FirstName,LastName,UserName,Email,Age,City,Device,Coffee Quantity,Order At", "Male,Carl,Wilderman,carl,yahoo.com,21->40,Seattle,Safari iPhone,2,afternoon", "Male,Marvin,Lind,marvin,hotmail.com,66->99,Detroit,Chrome Android,2,afternoon", "Female,Shanelle,Marquardt,shanelle,hotmail.com,21->40,Las Vegas,Chrome,1,afternoon", "Female,Lavonne,Romaguera,lavonne,yahoo.com,66->99,Seattle,Chrome,2,morning", "Male,Derick,McLaughlin,derick,hotmail.com,41->65,Chicago,Chrome Android,1,afternoon"])
