using System;
using System.Data;
using System.Data.SqlClient;

//utilizaremos la tabla PRODUCTO de la base de datos para hacer el crud correspondiente
public class crud {


    connection conn = new connection();
    //constructor
    public crud () {

    }


    //obtener todos los registros
    public DataSet GetAll(){
        string query = "SELECT * FROM PRODUCTO";
        DataSet dataSet = new DataSet();
        try
        {
            conn.Open();
            SqlDataAdapter dataAdapter = new SqlDataAdapter(query, conn.Conectarbd);
            dataAdapter.Fill(dataSet);

            Console.WriteLine("Numero de registros encontrados: "+dataSet.Tables[0].Rows.Count);
            foreach (DataRow row in dataSet.Tables[0].Rows){
                        Console.WriteLine("CODIGO: "+row["COD_PRODUCTO"] + ",  NOMBRE: " + row["DESCRIPCION"]);
             }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error: {ex.Message}");
        }
        finally
        {
            conn.Close();
        }
        return dataSet;
    }

    //crear nuevo registro
    public int Create(string desc){
        string insertSql = "INSERT INTO PRODUCTO (DESCRIPCION) VALUES (@descripcion)";
        SqlCommand insertCommand = new SqlCommand(insertSql, conn.Conectarbd);
        int filasAfectadas = 0;

        // ingresaremos datos estaticos para efectos de prueba
        insertCommand.Parameters.AddWithValue("@descripcion", desc);
        try
        {
            conn.Open();
            filasAfectadas = insertCommand.ExecuteNonQuery();
            Console.WriteLine("Registro insertado con éxito");
            Console.WriteLine($"Registros afectados: {filasAfectadas}");
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error: {ex.Message}");
        }
        finally
        {
            conn.Close();
        }
        return filasAfectadas;
    }

    //actualizar registro
    public int Update(string new_desc, string old_desc){
        
        string updateSql = "UPDATE PRODUCTO SET DESCRIPCION = @new_desc WHERE DESCRIPCION = @old_desc";
        SqlCommand updateCommand = new SqlCommand(updateSql, conn.Conectarbd);
        int filasAfectadas = 0;

        updateCommand.Parameters.AddWithValue("@new_desc", new_desc);
        updateCommand.Parameters.AddWithValue("@old_desc", old_desc);

        try
        {
            conn.Open();
            filasAfectadas = updateCommand.ExecuteNonQuery();
            if(filasAfectadas == 0){
                Console.WriteLine("No existen registros para actualizar");
            }else{
                Console.WriteLine("Registros actualizados con éxito");
            }
            
            Console.WriteLine($"Registros afectados: {filasAfectadas}");
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error: {ex.Message}");
        }
        finally
        {
            conn.Close();
        }
        return filasAfectadas;
    }

    //eliminar registro
    public int Delete(string desc){
        string deleteSql = "DELETE FROM PRODUCTO WHERE DESCRIPCION = @desc";
        SqlCommand deleteCommand = new SqlCommand(deleteSql, conn.Conectarbd);
        int filasAfectadas = 0;
        deleteCommand.Parameters.AddWithValue("@desc", desc);

        try
        {
            conn.Open();
            filasAfectadas = deleteCommand.ExecuteNonQuery();
            if(filasAfectadas == 0){
                Console.WriteLine("No existen registros para eliminar");
            }else{
                Console.WriteLine("Registros eliminados con éxito");
            }
            
            Console.WriteLine($"Registros afectados: {filasAfectadas}");
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error: {ex.Message}");
        }
        finally
        {
            conn.Close();
        }
        return filasAfectadas;
    }
}