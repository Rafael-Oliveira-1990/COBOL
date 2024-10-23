      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       DATA DIVISION.
       FILE SECTION.
              WORKING-STORAGE                  SECTION.
       01  WRK-CABEC1.
           05 FILLER         PIC X(020) VALUE SPACES.
           05 FILLER         PIC X(020) VALUE
           "LISTA DE CLIENTES".
           05 FILLER         PIC X(020) VALUE SPACES.
           05 FILLER         PIC X(005) VALUE "PAG: ".
           05 WRK-PAG        PIC 9(003) VALUE 1.

       01  WRK-CABEC2.
           05 FILLER         PIC X(004) VALUE "COD".
           05 FILLER         PIC X(021) VALUE "NOME".
           05 FILLER         PIC X(021) VALUE "EMAIL".
           05 FILLER         PIC X(011) VALUE "STREAMING".
           05 FILLER         PIC X(005) VALUE "VALOR".

       01  WRK-CABEC3.
           05 WRK-BRANCO     PIC X(80)  VALUE SPACES.


       01  WRK-DETALHE.
           05 WRK-DET-CODIGO    PIC 9(03) VALUE ZEROS.
           05 FILLER            PIC X(01) VALUE SPACES.
           05 WRK-DET-NOME      PIC X(20) VALUE sPACES.
           05 FILLER            PIC X(01) VALUE SPACES.
           05 WRK-DET-EMAIL     PIC X(20) VALUE sPACES.
           05 FILLER            PIC X(01) VALUE SPACES.



       PROCEDURE                        DIVISION.
      *=================================================================
       0000-PRINCIPAL                        SECTION.
             DISPLAY WRK-CABEC1.
             DISPLAY WRK-CABEC3.
             DISPLAY WRK-CABEC2.


             GOBACK.
