using System;

// Luego podremos usarla desde cualquier otro lugar

namespace C__TEST
{
    class Program
    {
        static void Main(string[] args)
        {
            crud _crud = new crud();

            bool salir = false;
 
            while (!salir) {
                
                    Console.WriteLine("1. Listar registros");
                    Console.WriteLine("2. Insertar registro");
                    Console.WriteLine("3. Actualizar registro");
                    Console.WriteLine("4. Eliminar registro");
                    Console.WriteLine("5. Salir");
                    Console.WriteLine("Elige una de las opciones");
                    int opcion = Convert.ToInt32(Console.ReadLine());
            
                    switch (opcion)
                    {
                        case 1:
                            Console.WriteLine("Listando registros");
                            //obtener data set de todos los registros
                            _crud.GetAll();

                            break;
            
                        case 2:
                            Console.WriteLine("Creando registro");
                            //enviaremos datos estaticos para efectos de prueba
                            _crud.Create("test");
                            break;
            
                        case 3:
                            Console.WriteLine("Actualizando registro");
                                        //enviaremos datos estaticos y actualizaremos por nombre para efectos de prueba
                            _crud.Update("test actualizado","test");
                            break;
                        case 4:
                            Console.WriteLine("Eliminando registro");
                            
                            //enviaremos datos estaticos y eliminaremos por nombre para efectos de prueba
                            _crud.Delete("test actualizado");
                            break;
                        case 5:
                            Console.WriteLine("Saliendo del programa");
                            salir = true;
                            break;
                        default:
                            Console.WriteLine("Elige una opcion entre 1 y 5");
                            break;
                    }
            
            }







        }
    }
}
