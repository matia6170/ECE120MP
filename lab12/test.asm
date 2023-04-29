.ORIG x3000


;INITIALIZE TWO COUNTERS FOR THE ROW AND THE COLUMN 
            AND R1, R1, #0
            ADD R1, R1, #8
            ADD R1, R1, #8
            AND R2, R2, #0
            ADD R2, R2, #8

;Load Line
ROWLOOP     LDR R4, R3, #0
            
;LOOP
COLLOOP     LDI R5, BLANK   ;Seting R5 as x5000
            AND R4, R4, R4  ;Selecting R4 for Branch
            BRnp #1         ;Skip the next line if positive 
            ADD R5, R5, #1 ;R5++
            LDR R0, R5, #0 ;R0 <- M[R5]
            OUT

            ADD R4, R4, R4  ;SHIFT LEFT
            ADD R2, R2, #-1 ;Decrement R2(ColCnt)
            BRp COLLOOP
            
            AND R0, R0, #0
            ADD R0, R0, #10

            ADD R3, R3, #1  ;Increment Starting address of the image. (To select the next line)
            ADD R1, R1, #-1 ;Decrement ROW COUNT
            BRp ROWLOOP

            HALT                ; Trap x25



BLANK   .FILL   x5000
SYMBOL  .FILL   x5001
LETTER  .FILL	x5002

NUM     .fill  x002A    ; Our Number to print
        .FILL	x0048
ASCII   .fill  x30    ; Our ASCII offset
.END
