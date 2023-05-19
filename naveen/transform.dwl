%dw 2.0
import * from dw::core::Strings
fun seq(num) = do {
var x = leftPad(num, 32, "0")
---
x[0 to 7] ++ "-" ++ x[8 to 11] ++ "-" ++ x[12 to 15] ++ "-" ++ x[16 to 19] ++ "-" ++ x[20 to -1]
}
output application/json  
---
flatten(payload) map ((item, index) -> {
  "GM": item.GM,
  "IM": item.IM,
  "SysID": seq(index)
})
//getting objects in a sequential manner by using indexes and mapping data along with objects and using flatten function to reduce array of arrays into one array