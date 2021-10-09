using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for Accounts
/// </summary>
public class Accounts
{
    public Accounts()
    {
           /// <summary>
           /// password algorithm for rabkenant
    }
       /// </summary>
    public static class Hashed
    {

        public static string HashPassword(string Password)
        {
            byte[] PasswordText;
            PasswordText = ASCIIEncoding.Unicode.GetBytes(Password);
            string Result;

            SHA256Managed FinalHash = new SHA256Managed(); //.ComputeHash(PasswordText);
            Result = Convert.ToBase64String(FinalHash.ComputeHash(PasswordText));
            //string salt = Hashed.TheSalt();
            // return Hashed.SaltedHash(Password, salt);
            return (Result);
        }
    }
/// <summary>
/// converst a dd/mm/yyyy to format yyyymmdd
/// </summary>
/// <param name="date"></param>
/// <returns></returns>
    public static int intDate(string date)
    {
        Func<string, int> yyyymmdd = (d) =>
        {
            string yyyy = d.Split('/')[2];
            string mm = d.Split('/')[1];
            string dd = d.Split('/')[0];
            return int.Parse(yyyy + mm + dd);
        };
        return yyyymmdd(date);
    }
    /// <summary>
    /// convert todays date into an integer
    /// </summary>
    /// <returns></returns>
    public static int TodaysDate()
    {
        Func<string, string> twodigit = (d) =>
        {

            return d.Length == 1 ? "0" + d : d;
        };


        return int.Parse(DateTime.Now.Year.ToString() + twodigit(DateTime.Now.Month.ToString()) + twodigit(DateTime.Now.Day.ToString()));
    }
    public static int intDDMMYYYY(string ddmmyyyy)
    {
        int ret=0;
            try
        {
            string[] array = ddmmyyyy.Split('/');
            ret =int.Parse( array[2] + array[1] + array[0]);
        }
        catch (Exception)
        {

            
        }
        return ret;
    }
    public static string UKdate(string yyyymmdd)
    {
        if (yyyymmdd.Length != 8) return string.Empty;
        return   yyyymmdd.Substring(6, 2) +"/" + yyyymmdd.Substring(4, 2) + "/" +yyyymmdd.Substring(0, 4);

    }
    public static string USdate(string yyyymmdd)
    {
        if (yyyymmdd.Length != 8) return string.Empty;
        return yyyymmdd.Substring(0, 4) + "/" + yyyymmdd.Substring(4, 2) + "/" + yyyymmdd.Substring(6, 2);

    }
}