using System;
using System.Data.SqlClient;
public class connection
{
      //Cadena de Conexion
      string conn_string ="data source = SENPAI; initial catalog = GEKO_TEST; user id = sa; password = senpai";

     public SqlConnection Conectarbd = new SqlConnection();

     //Constructor
     public connection ()
     {
       Conectarbd.ConnectionString=conn_string;
     }

     //Metodo para abrir la conexion
     public void Open()
     {
        try
         {
            Conectarbd.Open();
            Console.WriteLine("Database online");
        } catch(Exception ex)
        {
            Console.WriteLine("error al abrir BD ", ex.Message); 
        }
     }

     //Metodo para cerrar la conexion
    public void Close()
     {
       Conectarbd.Close();
       Console.WriteLine("Database offline");
    }
}