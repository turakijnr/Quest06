def my_csv_parser(csv_file, seperator)
    data_array = csv_file.split()
    csv = data_array.map do |line| 
          line.split(seperator)
    end
    return csv
end

#p my_csv_parser("a,b,c,e\n1,2,3,4\n",",")