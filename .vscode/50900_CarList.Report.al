report 50900 "Car List"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Car List Report';
    DefaultRenderingLayout = CarList;
    
    dataset
    {
        dataitem(Car;Car)
        {
            RequestFilterFields = "No.";
            column(No_;"No.")
            {
                
            }

            column(Name;Name)
            {

            }

            column(Brand_Code;"Brand Code")
            {

            }
        }
    }
    
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    
                }
            }
        }
    
        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;
                    
                }
            }
        }
    }
    
    rendering
    {
        layout(CarList)
        {
            Type = RDLC;
            LayoutFile = './Reports/CarList.rdl';
        }
    }
    
    var
        myInt: Integer;
}