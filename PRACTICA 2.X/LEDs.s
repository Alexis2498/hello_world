PROCESSOR 16F887
    #include <xc.inc>
    ;CONFIG word1
    CONFIG FOSC = INTRC_NOCLKOUT
    CONFIG WDTE = OFF
    CONFIG PWRTE = ON
    CONFIG MCLRE = OFF
    CONFIG CP = OFF
    CONFIG CPD = OFF
    CONFIG BOREN = OFF
    CONFIG IESO = OFF
    CONFIG FCMEN = ON
    CONFIG DEBUG = ON
    ;CONGIG 2 
    CONFIG BOR4V=BOR40V
    CONFIG WRT=OFF
    PSECT udata
 main2:
    DS 1
 cont:
    DS 1
   
    PSECT restVec,class=CODE,delta=2
 resetVec:
    PAGESEL main
    goto main
  PSECT code
 main:
    BANKSEL ANSEL
CLRF ANSEL
BANKSEL TRISA
MOVLW 0b00000000
MOVWF TRISA
BANKSEL PORTA
CLRF PORTA
bcf STATUS,5
bsf STATUS,6
bcf STATUS,0
    inicio:
    bcf STATUS,0
    bcf STATUS,5
    bcf STATUS,6
    movlw 0b00000001
    movwf PORTA
    goto incizquierda
    incizquierda:
    RLF PORTA
    BTFSS PORTA,7
    goto incizquierda
    goto incderecha
    incderecha:
    RRF PORTA
    BTFSS PORTA,0
    goto incderecha
    goto incizquierda
    goto  inicio
    END
    
   


