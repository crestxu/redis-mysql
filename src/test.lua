require "mysql"
require "print_r"

local db, err = mysql.connect('tc-veyron-rd01.tc:8879', 'root', '')
print(db)
print(err)
print(db:select_db('test'))
print(db:set_charset("utf-8"))
local rs = db:query("select * from `table`")
print(rs:num_fields())
print(rs:num_rows())



print('------ row ----------')
local row = rs:fetch_row()
print_r(row)
print('------ assoc ----------')
local row = rs:fetch_assoc()
print_r(row)
print('------array MYSQL_BOTH----------')
local row = rs:fetch_array("MYSQL_BOTH")
print_r(row)
print('------array MYSQL_ASSOC----------')
local row = rs:fetch_array("MYSQL_ASSOC")
print_r(row)
print('------array MYSQL_NUM----------')
local row = rs:fetch_array("MYSQL_NUM")
print_r(row)
print('------array----------')
local row = rs:fetch_array()
print_r(row)
--os.exit()
while row do
    print_r(row)
    --row = rs:fetch_array("MYSQL_NUM")
    row = rs:fetch_array("MYSQL_BOTH")
    --row = rs:fetch_array("MYSQL_ASSOC")
end

print(mysql.version());








--[[
print('----row------------')
local row = rs:fetch_row()
while row do
    print_r(row)
    row = rs:fetch_row()
end
--]]

--[[
print('--------assoc--------')
local row = rs:fetch_assoc()
while row do
    print_r(row)
    row = rs:fetch_assoc()
end
--]]

