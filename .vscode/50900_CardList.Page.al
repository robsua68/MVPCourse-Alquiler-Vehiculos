page 50900 "Car List"
{
    Caption = 'Car List';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = Car;
    Editable = false;
    CardPageId = "Car Card";
    
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No.";Rec."No.")
                {
                    ApplicationArea = All;
                }

                field(Name;Rec.Name)
                {
                    ApplicationArea = All;
                }

                field("Brand Code";Rec."Brand Code")
                {
                    ApplicationArea = All;
                }
                
            }
        }
        area(Factboxes)
        {
            
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