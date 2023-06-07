page 50901 "Brand List"
{
    Caption = 'Brand List';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = Brand;
    Editable = true;
    
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Code;Rec.Code)
                {
                    ApplicationArea = All;
                }

                field("Cars Count";Rec."Cars Count")
                {
                    ApplicationArea = All;
                }  
            }
        }
        area(Factboxes)
        {

            systempart(Links; Links)
            {

            }

            systempart(Notes; Notes)
            {

            }
        
        }
    }
    
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;
                
                trigger OnAction();
                begin
                    
                end;
            }
        }
    }
}