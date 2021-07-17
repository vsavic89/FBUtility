# FBUtility

IDE: Delphi XE3+

Requirements: 
1. Firebird v2.0+
2. fbclient.dll in the root application directory (if the firebird is not installed on a machine, than proper version of DLL needs to be used) 
3. [optional] Directory "podesavanja/podesavanjaN.ini"
  Example of .ini content: 
    [IME_SERVERA] = "127.0.0.1"
    [PUTANJA] = "C:\baza.fdb"
    
    IME_SERVERA = Host Name
    PUTANJA = FDB path

The application provides following functionalities:
  - Query execution against with data row update/delete functions
  - Making backups and restores
  - Sweep the db
  - Read the header of the db
