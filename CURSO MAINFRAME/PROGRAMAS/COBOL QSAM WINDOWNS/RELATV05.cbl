      *-----------------------------------------------------------------
       IDENTIFICATION                   DIVISION.
       PROGRAM-ID. RELATV05.
      *=================================================================
      *== PROGRAMA....: ASSINACLI
      *== PROGRAMADOR.: RAFAEL DE OLIVEIRA
      *== ANALISTA....: IVAN SANCHES
      *== DATA........: 08/08/2024
      *== CONSULTORIA:
      *-----------------------------------------------------------------
      *== OBJETIVO....:
      *
      *-----------------------------------------------------------------
      *===================ESPECIFICACOES DO PROGRAMA====================
      *    ARQUIVO                    TIPO               BOOK
      *    ASSINACL                  INPUT              BOOKMSG
      *    ASSINACL                  INPUT              BOOKASSI
      *-----------------------------------------------------------------
      *== MODULOS
      *
      *-----------------------------------------------------------------
      *-------------------ALTERACOESDO PROGRAMA-------------------------

      *== PROGRAMADOR.:
      *== ANALISTA....:
      *== CONSULTORIA.:
      *== DATA........:
      *== OBJETIVO....:

      *=================================================================
       ENVIRONMENT                      DIVISION.
      *=================================================================

      *-----------------------------------------------------------------
       CONFIGURATION                    SECTION.
      *-----------------------------------------------------------------
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
      *-----------------------------------------------------------------
       INPUT-OUTPUT                     SECTION.
      *-----------------------------------------------------------------

       FILE-CONTROL.
           SELECT CLIENTES ASSIGN TO "C:\RELATORIO\dados\cliente1.txt"
           FILE STATUS IS FS-CLIENTES.

ALT03      SELECT RELAT ASSIGN   TO  "C:\RELATORIO\dados\RELAT.txt"
ALT03      FILE STATUS IS FS-RELAT.
      *-----------------------------------------------------------------

      *=================================================================
       DATA                             DIVISION.
      *=================================================================

      *-----------------------------------------------------------------
       FILE                             SECTION.
      *-----------------------------------------------------------------
      *
      *            INPUT - DADOS DO ARQUIVO DE ENTRADA(CLIENTES)
      *            LRECL = 58 POSICOES
      *
      *-----------------------------------------------------------------
       FD  CLIENTES.
       01  REG-CLIENTES.
           05 REG-CODIGO                PIC 9(003).
           05 REG-NOME                  PIC X(020).
           05 REG-EMAIL                 PIC X(20).
           05 REG-STREAMING             PIC X(010).
           05 REG-ASSINATURA            PIC 9(003)V99.

      *-----------------------------------------------------------------
      *            OUTPUT - DADOS DO ARQUIVO DE SAIDA(RELAT)
      *            LRECL  = 68 POSICOES
      *
      *-----------------------------------------------------------------

       FD  RELAT.
       01  REG-RELAT                    PIC X(068).

      *-----------------------------------------------------------------
       WORKING-STORAGE                  SECTION.
      *-----------------------------------------------------------------

      *-----------------------------------------------------------------
       01  FILLER                       PIC X(050)         VALUE
              "INICIO DA WORKING".
      *-----------------------------------------------------------------


      *-----------------------------------------------------------------
       01  FILLER                       PIC X(050)         VALUE
              "-----VARIAVEL DE STATUS-----".
      *-----------------------------------------------------------------

       01  FS-CLIENTES                  PIC 9(002)         VALUE ZEROS.

      *-----------------------------------------------------------------
       01  FILLER                       PIC X(050)         VALUE
              "-----VARIAVEL DE STATUS DE GRAVACAO-----".
      *-----------------------------------------------------------------

       01  FS-RELAT                     PIC 9(002)         VALUE ZEROS.

      *-----------------------------------------------------------------

      *-----------------------------------------------------------------
       01  FILLER                       PIC X(050)         VALUE
              "CABECALHO DE PAGINACAO".
      *-----------------------------------------------------------------

       01  WRK-CABECALHO1.
           05 FILLER                    PIC X(015)         VALUE SPACES.
           05 FILLER                    PIC X(020)         VALUE
              "LISTA DE CLIENTES".
           05 FILLER                    PIC X(020)         VALUE SPACES.
           05 FILLER                    PIC X(010)         VALUE
              "PAGINA:".
           05 ACU-PAG                   PIC 9(003)         VALUE 1.

      *-----------------------------------------------------------------

      *-----------------------------------------------------------------
       01  FILLER                       PIC X(050)         VALUE
              "-----CABECALHO DE DESCRICAO-----".
      *-----------------------------------------------------------------

       01  WRK-CABECALHO2.
           05 WRK-CODIGO                PIC X(004)         VALUE
              "COD ".
           05 WRK-NOME                  PIC X(021)         VALUE
              "NOME ".
           05 WRK-EMAIL                 PIC X(021)         VALUE
              "EMAIL".
           05 WRK-STREAMING             PIC X(011)         VALUE
              "STREAMING".
           05 WRK-ASSINATURA            PIC ZZ.ZZ9,99         VALUE
              "VALOR".
      *-----------------------------------------------------------------

      *-----------------------------------------------------------------
       01  FILLER                       PIC X(050)         VALUE
              "-----CABECALHO DE LINHA EM BRANCO-----".
      *-----------------------------------------------------------------

       01  WRK-CABECALHO3.
           05 WRK-BRANCO                PIC X(080)         VALUE SPACES.
      *-----------------------------------------------------------------

       01  WRK-CABECALHO4.
           05  WRK-DET-SUBTOTAL        PIC X(025)          VALUE
              "SUBTOTAL POR PAGINA".
           05 FILLER                   PIC X(032)          VALUE SPACES.
           05  ACU-SUBTOTAL            PIC ZZ.ZZ9,99       VALUE ZEROS.

       01  WRK-CABECALHO5.
           05  WRK-DET-TOTAL           PIC X(025)          VALUE
              "VALOR TOTAL GERAL" .
           05 FILLER                   PIC X(032)          VALUE SPACES.
           05 ACU-TOTAL                PIC ZZ.ZZ9,99       VALUE ZEROS.

       01 FILLER                       PIC X(02)           VALUE SPACES.

      *-----------------------------------------------------------------
       01  FILLER                      PIC X(050)         VALUE
              "-----VARIAVEIS DE DETALHE CABECALHO-----".
      *-----------------------------------------------------------------

       01  WRK-DETALHE.
           05 WRK-DET-COD              PIC 9(003)          VALUE ZEROS.
           05 FILLER                   PIC X(001)          VALUE SPACES.
           05 WRK-DET-NOME             PIC X(020)          VALUE SPACES.
           05 FILLER                   PIC X(001)          VALUE SPACES.
           05 WRK-DET-EMAIL            PIC X(020)          VALUE SPACES.
           05 FILLER                   PIC X(001)          VALUE SPACES.
           05 WRK-DET-STREAMING        PIC X(010)          VALUE SPACES.
           05 FILLER                   PIC X(001)          VALUE SPACES.
           05 WRK-DET-ASSINATURA       PIC 9(003)V99       VALUE ZEROS.

       01  WRK-STREAMING-AUX           PIC X(010)          VALUE SPACES.

      *-----------------------------------------------------------------

       01  WRK-SUBTOTAL-AUX           PIC 9(005)v99 COMP-3 VALUE ZEROS.
       01  WRK-TOTAL-AUX              PIC 9(005)v99 COMP-3 VALUE ZEROS.
       01  WRK-ASSINATURA-AUX         PIC 9(005)v99 COMP-3 VALUE ZEROS.
      *-----------------------------------------------------------------
       01  FILLER                      PIC X(050)          VALUE
              "-----VARIAVEL DE QUANTIDADE DE LINHAS-----".

      *-----------------------------------------------------------------
       01  ACU-QTLINHAS                PIC 9(002)  COMP-3  VALUE ZEROS.

      *-----------------------------------------------------------------
       01  FILLER                      PIC X(050)          VALUE
              "-----VARIAVEL DE ACUMULACAO-----".

      *-----------------------------------------------------------------

       01  ACU-LIDOS                    PIC 9(002)  COMP-3 VALUE ZEROS.
      *-----------------------------------------------------------------

       01  FILLER                       PIC X(050)         VALUE
              "-----BOOK DE MENSAGEM DEDE ERRO DOS ARQUIVOS-----".

      *-----------------------------------------------------------------

       COPY "BOOKASSI".

      *-----------------------------------------------------------------
       01  FILLER                       PIC X(050)         VALUE
              "-----BOOK MENSAGEM DE STATUS DE ERRO PROGRAMA-----".

      *-----------------------------------------------------------------
       COPY "BOOKMSG".

      *-----------------------------------------------------------------
       01  FILLER                       PIC X(050)         VALUE
             "-----FIM DA WORKING-----".
      *-----------------------------------------------------------------


      *=================================================================
       PROCEDURE                        DIVISION.
      *=================================================================

      *-----------------------------------------------------------------
       0000-PRINCIPAL                   SECTION.
      *-----------------------------------------------------------------

           PERFORM 0100-INICIALIZAR.
           PERFORM 0150-VERIFICAR-VAZIO.
           PERFORM 0200-PROCESSAR UNTIL FS-CLIENTES NOT EQUAL 00.
           PERFORM 0300-FINALIZAR.

       0000-PRINCIPAL-FIM.              EXIT.

      *-----------------------------------------------------------------
       0100-INICIALIZAR                 SECTION.
      *-----------------------------------------------------------------

           OPEN INPUT CLIENTES

           IF FS-CLIENTES NOT EQUAL ZEROS
               MOVE WRK-ERRO-ABERTURA        TO WRK-DESCRICAO-ERRO
               MOVE FS-CLIENTES              TO WRK-STATUS-ERRO
               MOVE "0111-ABERTURA-CLIENTES" TO WRK-AREA-ERRO
               MOVE "RELATV03"               TO WRK-PROGRAMA-ERRO
               MOVE "CLIENTES"               TO WRK-ARQUIVO-ERRO
               PERFORM 9999-TRATAR-ERRO
           END-IF.

           OPEN OUTPUT RELAT.
           IF FS-CLIENTES NOT EQUAL ZEROS
               MOVE WRK-ERRO-ABERTURA        TO WRK-DESCRICAO-ERRO
               MOVE FS-RELAT                 TO WRK-STATUS-ERRO
               MOVE "0112-ABERTURA-RELAT"    TO WRK-AREA-ERRO
               MOVE "RELATV03"               TO WRK-PROGRAMA-ERRO
               MOVE "RELAT"                  TO WRK-ARQUIVO-ERRO
               PERFORM 9999-TRATAR-ERRO
           END-IF.
       0100-INICIALIZAR-FIM.            EXIT.

      *-----------------------------------------------------------------
       0150-VERIFICAR-VAZIO             SECTION.
      *-----------------------------------------------------------------

           PERFORM 0160-LER-DADOS.

           IF FS-CLIENTES NOT EQUAL 00
               PERFORM 0210-IMPRIMIR-CABECALHO
               MOVE REG-STREAMING TO WRK-STREAMING-AUX
           END-IF.


       0150-VERIFICAR-VAZIO-FIM.        EXIT.

      *-----------------------------------------------------------------
       0160-LER-DADOS                   SECTION.
      *-----------------------------------------------------------------

               READ CLIENTES.

       0160-LER-DADOS-FIM.              EXIT.

      *-----------------------------------------------------------------
       0200-PROCESSAR                   SECTION.
      *-----------------------------------------------------------------

           ADD 1   TO ACU-LIDOS.

           IF REG-STREAMING  NOT EQUAL WRK-STREAMING-AUX
                   PERFORM 0210-IMPRIMIR-CABECALHO
                   MOVE REG-STREAMING TO WRK-STREAMING-AUX
           END-IF.

               IF ACU-QTLINHAS  GREATER 12
                  PERFORM 0210-IMPRIMIR-CABECALHO
               END-IF.

           PERFORM 0220-IMPRIMIR-DETALHE.
           PERFORM 0160-LER-DADOS.

       0200-PROCESSAR-FIM.              EXIT.

      *-----------------------------------------------------------------
       0205-SUB-TOTAL                   SECTION.
      *-----------------------------------------------------------------
               MOVE   WRK-CABECALHO3 TO REG-RELAT
               WRITE  REG-RELAT AFTER 1 LINE.

               MOVE WRK-CABECALHO4  TO REG-RELAT
               WRITE REG-RELAT AFTER 1 LINE.

               ADD WRK-SUBTOTAL-AUX TO WRK-TOTAL-AUX.
               MOVE WRK-TOTAL-AUX TO ACU-TOTAL.
               MOVE ZEROS TO WRK-SUBTOTAL-AUX.

       0205-SUB-TOTAL-FIM.              EXIT.

      *-----------------------------------------------------------------
       0206-TOTAL-GERAL                 SECTION.
      *-----------------------------------------------------------------
               MOVE   WRK-CABECALHO3 TO REG-RELAT
               WRITE  REG-RELAT AFTER 1 LINE.

               MOVE WRK-CABECALHO5 TO REG-RELAT
               WRITE REG-RELAT AFTER 1 LINE.

       0206-TOTAL-GERAL-FIM.            EXIT.

      *-----------------------------------------------------------------
       0210-IMPRIMIR-CABECALHO          SECTION.
      *-----------------------------------------------------------------
           IF ACU-PAG GREATER THAN 1
               IF REG-STREAMING  NOT EQUAL WRK-STREAMING-AUX
                  PERFORM 0205-SUB-TOTAL
               END-IF

               MOVE   WRK-CABECALHO3 TO REG-RELAT
               WRITE  REG-RELAT      AFTER PAGE
           END-IF.

               MOVE   WRK-CABECALHO1 TO REG-RELAT
               WRITE  REG-RELAT      AFTER 1 LINE

               MOVE   WRK-CABECALHO3 TO REG-RELAT
               WRITE  REG-RELAT AFTER 1 LINE.

               MOVE   WRK-CABECALHO2 TO REG-RELAT
               WRITE  REG-RELAT      AFTER 1 LINE

               MOVE   WRK-CABECALHO3 TO REG-RELAT
               WRITE  REG-RELAT AFTER 1 LINE.

               ADD 1                 TO ACU-PAG.
               MOVE 4                TO ACU-QTLINHAS.

       0210-IMPRIMIR-CABECALHO-FIM.      EXIT.

      *-----------------------------------------------------------------
       0220-IMPRIMIR-DETALHE             SECTION.
      *-----------------------------------------------------------------

.              MOVE REG-CODIGO              TO WRK-DET-COD
               MOVE REG-NOME                TO WRK-DET-NOME
               MOVE REG-EMAIL               TO WRK-DET-EMAIL
               MOVE REG-STREAMING           TO WRK-DET-STREAMING
               MOVE REG-ASSINATURA          TO WRK-DET-ASSINATURA

.              MOVE WRK-DETALHE             TO REG-RELAT.
               WRITE REG-RELAT AFTER 1 LINE.

               ADD 1 TO  ACU-QTLINHAS

               ADD WRK-DET-ASSINATURA       TO WRK-SUBTOTAL-AUX.
               MOVE WRK-SUBTOTAL-AUX        TO ACU-SUBTOTAL.

       0220-IMPRIMIR-DETALHE-FIM.       EXIT.

      *-----------------------------------------------------------------
       0230-ESTATISTICA                 SECTION.
      *-----------------------------------------------------------------

               DISPLAY WRK-TRACO.
               DISPLAY "TOTAL DE REGISTROS LIDOS: " ACU-LIDOS.
               DISPLAY WRK-TRACO.
               DISPLAY WRK-FIM-PROGRAMA.
               DISPLAY WRK-TRACO.

       0230-ESTATISTITA-FIM.            EXIT.

      *-----------------------------------------------------------------
       0300-FINALIZAR                   SECTION.
      *-----------------------------------------------------------------

           IF  ACU-LIDOS GREATER ZEROS
               PERFORM 0230-ESTATISTICA
               IF ACU-QTLINHAS LESS 13
                   PERFORM 0205-SUB-TOTAL
               END-IF
                   PERFORM 0206-TOTAL-GERAL
           END-IF.

ALT03  0310-FECHAR-CLIENTES.

           CLOSE CLIENTES.

           IF FS-CLIENTES NOT EQUAL ZEROS
               MOVE WRK-ERRO-FECHAR        TO WRK-DESCRICAO-ERRO
               MOVE FS-CLIENTES            TO WRK-STATUS-ERRO
               MOVE "0310-FECHAR-CLIENTES" TO WRK-AREA-ERRO
               MOVE "RELATV03"             TO WRK-PROGRAMA-ERRO
               MOVE "CLIENTES"             TO WRK-ARQUIVO-ERRO
               PERFORM 9999-TRATAR-ERRO
           END-IF.

       0320-FECHAR-RELAT.

           CLOSE RELAT.

           IF FS-RELAT NOT EQUAL ZEROS
               MOVE WRK-ERRO-FECHAR        TO WRK-DESCRICAO-ERRO
               MOVE FS-RELAT               TO WRK-STATUS-ERRO
               MOVE "0320-FECHAR-RELAT"    TO WRK-AREA-ERRO
               MOVE "RELATV03"             TO WRK-PROGRAMA-ERRO
               MOVE "RELAT"                TO WRK-ARQUIVO-ERRO
               PERFORM 9999-TRATAR-ERRO
           END-IF.

             GOBACK.

       0300-FINALIZAR-FIM.              EXIT.

      *-----------------------------------------------------------------
       9999-TRATAR-ERRO                 SECTION.
      *-----------------------------------------------------------------

               DISPLAY WRK-MSG-ERROS.
               GOBACK.

       9999-TRATAR-ERRO-FIM.            EXIT.
