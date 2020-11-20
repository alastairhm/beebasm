    PHA
    LSR A
    LSR A
    LSR A
    LSR A
    JSR prtNibble
    PLA
    .prtNibble
    AND #15
    CMP #10
    BCC prtDigit
    ADC #6
    .prtDigit
    ADC #48
    JSR oswrch
    RTS
