public class chkDupNote
{  
    public static void Attendance(circebsc__Progress_Note_v2__c[] acc)
    {         
        List<circebsc__Progress_Note_v2__c> lists = new List<circebsc__Progress_Note_v2__c>();
        integer count=0;
        String strNote = ' ';          
        For (circebsc__Progress_Note_v2__c  c:acc )
        {         
            count++;
            If ( count<999 ) 
            {           
                String strName = c.Name;
                Integer x = c.name.length();
                String strNameLeft = c.Name.Substring(0,x-8);  //rub out the year and dates
                List<circebsc__Progress_Note_v2__c> projects = new List<circebsc__Progress_Note_v2__c>();
                for(circebsc__Progress_Note_v2__c proj : [SELECT Name, circebsc__Progress_Notes__c FROM circebsc__Progress_Note_v2__c WHERE Name LIKE :('%'+strNameLeft+'%')])
                {
                    strNote = c.circebsc__Progress_Notes__c;           
                    if(proj.circebsc__Progress_Notes__c.contains(strNote)) 
                    {
                        projects.add(proj);
                    }              
                } 
                if (projects.size()>0 )
                { 
                    delete projects[projects.size()-1]; 
                }
                c.circebsc__Progress_Notes__c = strNameLeft + '/' + projects.size()  +  strNote;
            }
        }      
    }
}