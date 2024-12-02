;Task for odd values in array
include irvine32.inc
.data
myArray word 2,4,9,13,6
msgSum byte "Sum of Odd values:",0
msgCount byte "Total Odd Numbers:",0
sum dword 0
count dword 0
.code
main proc
;LSB of an Odd number is 1
mov eax,0
;Loading the address of array
mov esi,offset myArray
;Setting counter for loop
mov ecx,lengthof myArray
;Loop
OddNumbers:
;Loading the current element into ax
mov ax,word ptr[esi]
;Checking if number is even
test ax,1
;If even skip addition
jz skipOdd
;Add Odd number to the eax
movsx eax,word ptr [esi]
;Add to the sum variable
add sum,eax 
;Increment the count of positive numbers 
add count,1   
skipOdd:
;Move to the next element
add esi,type myArray
;Terminate the loop 
loop OddNumbers
;Loading the address of msg 1
mov edx,offset msgSum
call writestring
;New Line
call crlf
;Displaying the sum
mov eax,sum
call writeint
call crlf 
;Loading the address of msg 2
mov edx,offset msgCount
call writestring
;New Line
call crlf
;Displaying the count
mov eax,count
call writeint
main endp
end main