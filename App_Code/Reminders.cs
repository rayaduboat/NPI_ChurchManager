using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Reminders
/// </summary>
public class Reminders
{
    public Reminders()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public object GetThisMonthBirthdays(int branchID)
    {
        var members = new object();
        try
        {
            Func<string, string> func = (date) => {
                string retval = "Not birthday";
                try
                {
                    string[] ddmm = date.Split(new char[] { '/','-' });
                    int day;       bool isdayint   ;
                    int month;     bool ismonthint ;
                    int year;      bool isyearint;
                    //check if day is supplied
                    if (ddmm.Length == 3)
                    {
                        //check if day is integer
                        isdayint = int.TryParse(ddmm[0], out day);
                        ismonthint = int.TryParse(ddmm[1], out month);
                        isyearint = int.TryParse(ddmm[2], out year);

                        if (month == DateTime.Now.Month)
                            return "Celebrates birthday on " + day.ToString();
                        else
                            return retval;
                    }
                    else if (ddmm.Length == 2)
                    {
                        //check if day is integer
                        isdayint = int.TryParse(ddmm[0], out day);
                        ismonthint = int.TryParse(ddmm[1], out month);
                        if (month == DateTime.Now.Month)
                            return "Celebrates birthday on " + day.ToString();
                        else
                            return retval;

                    }
                     
                     

                }
                catch (Exception)
                {

                     
                }
                return retval;
            };
            //get members DOB dd/mm/yyyy
            DistrictDBEntities districtDBEntities = new DistrictDBEntities();
             members = (from match in districtDBEntities.Members.AsEnumerable()
                        where match.BranchID==branchID
                         let x = new {
                             match.FirstName,
                             match.LastName,
                             IsBirthday = match.DOB!=null? func(match.DOB): "Not birthday",
                         }
                         select x)
                         .ToList()
                         .Where(i=>i.IsBirthday!= "Not birthday")
                         .OrderByDescending(i=>i.LastName)
                         .Select(i=>i);
        }
        catch (Exception ex)
        {

            
        }
        return members;
    }
}