      *-----------------------------------------------------------------
       IDENTIFICATION                   DIVISION.
       PROGRAM-ID. RELATV02.
      *=================================================================
      *== PROGRAMA....: ASSINACLI
      *== PROGRAMADOR.: RAFAEL DE OLIVEIRA
      *== ANALISTA....: IVAN SANCHES
      *== DATA........: 31/07/2024
      *== CONSULTORIA:
      *-----------------------------------------------------------------
      *== OBJETIVO....: CRIAR UM PROGRAMA QUE MOSTRE EM TELA ESTATISTICA
      *                 E PAGINACAO.
      *-----------------------------------------------------------------
      *===================ESPECIFICACOES DO PROGRAMA====================
      *    ARQUIVO                    TIPO               BOOK
      *    ASSINACL                  INPUT              BOOKMSG
      *    ASSINACL                  INPUT              BOOKASSI
      *-----------------------------------------------------------------
      *== MODULOS
      *
      *-----------------------------------------------------------------
      *                          ALTERACOES

ALT01 *== PROGRAMADOR.: RAFAEL DE OLIVEIRA
.     *== ANALISTA....: IVANS SANCHES
.     *== CONSULTORIA.:
.     *== DATA........: 31/07/2024
ALT01 *== OBJETIVO....: ADICIONOU CONTADOR DE PAGINACAO
      *
      *
      *
      *=================================================================

ALT02 *== PROGRAMADOR.: RAFAEL DE OLIVEIRA
.     *== ANALISTA....: IVANS SANCHES
.     *== CONSULTORIA.:
.     *== DATA........: 01/07/2024
ALT02 *== OBJETIVO....: ADICINOU SECAO DE ESTATISTICA COM TOTAL DE
      *                 REGISTROS LIDOS, FIM DO PROGRAMA E ESPACO EM
      *                 BRANCO PARA DEIXAR LINHA EM BRANCO.
      *
      *
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
           SELECT CLIENTES ASSIGN TO "C:\RELATORIO\dados\clientes.txt"
           FILE STATUS IS FS-CLIENTES.

      *-----------------------------------------------------------------

      *=================================================================
       DATA                             DIVISION.
      *=================================================================

      *-----------------------------------------------------------------
       FILE                             SECTION.
      *-----------------------------------------------------------------

       FD  CLIENTES.
       01  REG-CLIENTES.
           05 REG-CODIGO                PIC 9(003).
           05 REG-NOME                  PIC X(020).
           05 REG-EMAIL                 PIC X(20).
           05 REG-STREAMING             PIC X(010).
           05 REG-ASSINATURA            PIC 9(003)V99.

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

      *-----------------------------------------------------------------
       01  FILLER                       PIC X(050)         VALUE
              "CABECALHO DE PAGINACAO".
      *-----------------------------------------------------------------

       01  WRK-CABECALHO1.
           05 FILLER                    PIC X(020)         VALUE SPACES.
           05 FILLER                    PIC X(020)         VALUE
              "LISTA DE CLIENTES".
           05 FILLER                    PIC X(020)         VALUE SPACES.
ALT01      05 FILLER                    PIC X(008)         VALUE
              "PAGINA:".
ALT01      05 WRK-PAGINA                PIC 9(003)          VALUE ZEROS.

       01  WRK-PAGINA-AUX               PIC 9(003)  COMP-3  VALUE 1.
      *-----------------------------------------------------------------

      *-----------------------------------------------------------------
       01  FILLER                       PIC X(050)         VALUE
              "-----CABECALHO DE DESCICAO-----".
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
           05 WRK-ASSINATURA            PIC X(005)         VALUE
              "VALOR".
      *-----------------------------------------------------------------

      *-----------------------------------------------------------------
       01  FILLER                       PIC X(050)         VALUE
              "-----CABECALHO DE LINHA EM BRANCO-----".
      *-----------------------------------------------------------------

       01  WRK-CABECALHO3.
           05 WRK-BRANCO                PIC X(080)         VALUE SPACES.
      *-----------------------------------------------------------------

      *-----------------------------------------------------------------
       01  FILLER                       PIC X(050)         VALUE
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
           05 WRK-DET-ASSINATURA       PIC ZZ9,99          VALUE ZEROS.
      *-----------------------------------------------------------------

      *-----------------------------------------------------------------
       01  FILLER                       PIC X(050)         VALUE
              "-----VARIAVEL DE QUANTIDADE DE LINHAS-----".

      *-----------------------------------------------------------------
       01  WRK-QT-LINHAS                PIC 9(002)         VALUE ZEROS.

      *-----------------------------------------------------------------
ALT02  01  FILLER                       PIC X(050)         VALUE
.             "-----VARIAVEL DE ACUMULACAO-----".
.
.     *-----------------------------------------------------------------
.
.      01  WRK-ACU-LIDOS                PIC 9(002) COMP-3  VALUE ZEROS.
ALT02 *-----------------------------------------------------------------

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
           PERFORM 0200-PROCESSAR UNTIL FS-CLIENTES EQUAL 10.
           PERFORM 0300-FINALIZAR.
       0000-PRINCIPAL-FIM.              EXIT.

      *-----------------------------------------------------------------
       0100-INICIALIZAR                 SECTION.
      *-----------------------------------------------------------------

           OPEN INPUT CLIENTES.
               PERFORM 0110-TESTAR-STATUS.
       0100-INICIALIZAR-FIM.            EXIT.

      *-----------------------------------------------------------------
       0110-TESTAR-STATUS               SECTION.
      *-----------------------------------------------------------------

           IF FS-CLIENTES NOT EQUAL ZEROS
               MOVE WRK-ERRO-ABERTURA    TO WRK-DESCRICAO-ERRO
               MOVE FS-CLIENTES          TO WRK-STATUS-ERRO
               MOVE "0110-TESTAR-STATUS" TO WRK-AREA-ERRO
               MOVE "ASSINACL"           TO WRK-PROGRAMA-ERRO
               MOVE "CLIENTES"           TO WRK-ARQUIVO-ERRO
               PERFORM 9999-TRATAR-ERRO
           END-IF.

       0110-TESTAR-STATUS-FIM.          EXIT.

      *-----------------------------------------------------------------
       0150-VERIFICAR-VAZIO             SECTION.
      *-----------------------------------------------------------------

           PERFORM 0160-LER-DADOS.

               IF FS-CLIENTES EQUAL 10
                   MOVE WRK-ARQ-VAZIO          TO WRK-DESCRICAO-ERRO
                   MOVE FS-CLIENTES            TO WRK-STATUS-ERRO
                   MOVE "0150-VERIFICAR-VAZIO" TO WRK-AREA-ERRO
                   MOVE "ASSINACL"             TO WRK-PROGRAMA-ERRO
                   MOVE "CLIENTES"             TO WRK-ARQUIVO-ERRO
                   PERFORM 9999-TRATAR-ERRO
               ELSE
                   MOVE WRK-PAGINA-AUX    TO WRK-PAGINA
                   PERFORM 0210-IMPRIMIR-CABECALHO
               END-IF.

       0150-VERIFICAR-VAZIO-FIM.        EXIT.

      *-----------------------------------------------------------------
       0160-LER-DADOS                   SECTION.
      *-----------------------------------------------------------------
           READ CLIENTES.

               IF FS-CLIENTES EQUAL 35
                   MOVE WRK-ERRO-LEIT    TO WRK-DESCRICAO-ERRO
                   MOVE FS-CLIENTES      TO WRK-STATUS-ERRO
                   MOVE "0160-LER-DADE"  TO WRK-AREA-ERRO
                   MOVE "ASSINACL"       TO WRK-PROGRAMA-ERRO
                   MOVE "CLIENTES"       TO WRK-ARQUIVO-ERRO
                   PERFORM 9999-TRATAR-ERRO
               END-IF.


       0160-LER-DADOS-FIM.              EXIT.

      *-----------------------------------------------------------------
       0200-PROCESSAR                   SECTION.
      *-----------------------------------------------------------------

           IF WRK-QT-LINHAS GREATER 12
               PERFORM 0210-IMPRIMIR-CABECALHO
           END-IF.
ALT02          ADD 1 TO WRK-ACU-LIDOS.
               PERFORM 0220-IMPRIMIR-DETALHE.
               PERFORM 0160-LER-DADOS.


       0200-PROCESSAR-FIM.              EXIT.

      *-----------------------------------------------------------------
       0210-IMPRIMIR-CABECALHO          SECTION.
      *-----------------------------------------------------------------

           DISPLAY WRK-CABECALHO3.
           DISPLAY WRK-CABECALHO1.
           DISPLAY WRK-CABECALHO3.
           DISPLAY WRK-CABECALHO2.
           DISPLAY WRK-CABECALHO3.
           ADD 1 TO WRK-PAGINA
           MOVE 4 TO WRK-QT-LINHAS.


       0210-IMPRIMIR-CABECALHO-FIM.      EXIT.

      *-----------------------------------------------------------------
       0220-IMPRIMIR-DETALHE             SECTION.
      *-----------------------------------------------------------------

           MOVE REG-CODIGO     TO WRK-DET-COD.
           MOVE REG-NOME       TO WRK-DET-NOME.
           MOVE REG-EMAIL      TO WRK-DET-EMAIL.
           MOVE REG-STREAMING  TO WRK-DET-STREAMING.
           MOVE REG-ASSINATURA TO WRK-DET-ASSINATURA.

             DISPLAY WRK-DETALHE.
             ADD 1 TO WRK-QT-LINHAS.

       0220-IMPRIMIR-DETALHE-FIM.       EXIT.

ALT02 *-----------------------------------------------------------------
.      0230-ESTATISTICA                 SECTION.
.     *-----------------------------------------------------------------
.          DISPLAY WRK-ESPACO-BRANCO.
.          DISPLAY "TOTAL DE REGISTROS LIDOS: " WRK-ACU-LIDOS.
.          DISPLAY WRK-ESPACO-BRANCO.
.          DISPLAY WRK-FIM-PROGRAMA.
ALT02  0230-ESTATISTITA-FIM.            EXIT.

      *-----------------------------------------------------------------
       0300-FINALIZAR                   SECTION.
      *-----------------------------------------------------------------
ALT02      IF WRK-ACU-LIDOS GREATER ZEROS
.              PERFORM 0230-ESTATISTICA
ALT02      END-IF.


           CLOSE CLIENTES.

               IF FS-CLIENTES NOT EQUAL ZEROS
                   MOVE WRK-ERRO-FECHAR  TO WRK-DESCRICAO-ERRO
                   MOVE FS-CLIENTES      TO WRK-STATUS-ERRO
                   MOVE "0300-FINALIZAR" TO WRK-AREA-ERRO
                   MOVE "ASSINACL"       TO WRK-PROGRAMA-ERRO
                   MOVE "CLIENTES"       TO WRK-ARQUIVO-ERRO
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
