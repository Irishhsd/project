using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.Serialization;

namespace VO
{
    public enum eStockStatus
    {
        IN_STOCK = 1,
        OUT_OF_STOCK,
        LOW_STOCK
    }
    public enum eDBAction
    {
        Insert = 1,
        Update = 2,
        Delete
    }

    public enum eErrorType
    {
        None = 0,           //Ninguno
        NotFound = 1,       //No se encontró
        Format,             //Conversión
        SqlError,           //Sql
        Validation,         //Controlados
        Connection,         //Conexión
        Timeout,            //Timeout por bloqueos o interbloqueos
        Unknown = 99        //Desconocido
    }

    /// <summary>
    /// Representa los diferentes esquemas que se manejan en este microservicio
    /// </summary>
    public class Schema
    {
        /// <summary>
        /// Esquma Products 
        /// </summary>
        public static readonly string Product = "Products";

        /// <summary>
        /// Esquma Product_Configurations
        /// </summary>
        public static readonly string Product_Configurations = "Product_Configurations";

        /// <summary>
        /// Esquma Cart
        /// </summary>
        public static readonly string Carts = "Carts";

        /// <summary>
        /// Esquma Cart_Items
        /// </summary>
        public static readonly string Cart_Items = "Cart_Items";

        /// <summary>
        /// Esquma Orders
        /// </summary>
        public static readonly string Orders = "Orders";

        /// <summary>
        /// Esquma Order_Items
        /// </summary>
        public static readonly string Order_Items = "Order_Items";

    }

    /// <summary>
    ///  Representa los diferentes procedimientos que se manejan en este microservicio
    /// </summary>
    public class Procedures
    {
        /// <summary>
        /// Procedimiento para insertar
        /// </summary>
        public static readonly string Insert = "Insert";

        /// <summary>
        /// Procedimiento para actualizar
        /// </summary>
        public static readonly string Update = "Update";


        /// <summary>
        /// Procedimiento para eliminar
        /// </summary>
        public static readonly string Delete = "Delete";


        /// <summary>
        /// Procedimiento para obtener un registro por identificador
        /// </summary>
        public static readonly string GetById = "GetById";


        /// <summary>
        /// Procedimiento para obtener todos los registros
        /// </summary>
        public static readonly string Getall = "Getall";

    }
}