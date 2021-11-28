using System; 
using System.Text; 

namespace RA.Servicios
{

    public static class Base64Encrypt
    {
        public static string EncriptarABase64(string dato)
        {
            string encriptedData = string.Empty;
            if (!string.IsNullOrEmpty(dato))
            {
                var byteArray = Encoding.UTF8.GetBytes(dato);
                encriptedData = Convert.ToBase64String(byteArray);

            }
            return encriptedData;
        }

        public static string DecriptarDesdeBase64(string sBase64)
        {
            string dencriptedData = string.Empty;
            if (!string.IsNullOrEmpty(sBase64))
            {
                byte[] byteArray = Convert.FromBase64String(sBase64);
                dencriptedData = Encoding.UTF8.GetString(byteArray);

            }
            return dencriptedData;
        }

    }
}