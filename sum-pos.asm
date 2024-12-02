;Task for positive numbers
include irvine32.inc
.data
myArray word 2,-3,5,6,-9
msgSum byte "Sum of Positive Numbers:",0
msgCount byte "Total Positive Numbers:",0
sum dword 0
count dword 0
.code
main proc
;1st step is to find the positive numbers in an array
;2nd step is to add those positive numbers 
;3rd step is to count the total positive numbers
mov eax,0
;Loading the address of array
mov esi,offset myArray
;Setting counter for loop
mov ecx,lengthof myArray
;Loop
positiveNumbers:
;Loading the current element into ax
mov ax,word ptr[esi]
;Checking if number is negative
test ax,8000h
;If negative skip addition
jnz skipPositive
;Add positive number to the eax
movsx eax,word ptr [esi]
;Add to the sum variable
add sum,eax 
;Increment the count of positive numbers 
add count,1   
skipPositive:
;Move to the next element
add esi,type myArray
;Terminate the loop 
loop positiveNumbers
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
exit
main endp
end main