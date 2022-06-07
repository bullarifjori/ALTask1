pageextension 50202 "ITS Code" extends "Purchase Order Subform"
{
    layout
    {
        addafter("No.")
        {

            field("ITS Code"; Rec."ITS Code")
            {
                ApplicationArea = All;
                trigger OnValidate()
                begin

                    // Header.Get(Rec."Document Type", Rec."Document No.");
                    // Rec.SetFilter("Document No.", Header."No.");
                    // Rec.SetFilter(Rec."No.", Rec."No.");
                    // Rec.SetFilter(Rec."ITS Code", Rec."ITS Code");
                    // if not Rec.IsEmpty then
                    //     Error(Text001);
                end;
            }
        }

    }

    actions
    {
        addafter("&Line")
        {
            action("Lidh me artikullin")
            {

                Caption = 'Lidh me Artikullin';
                Visible = true;
                ApplicationArea = All;
                Promoted = true;
                Image = Action;
                trigger OnAction()
                var
                    myInt: Integer;
                    itscode: Record ItemVariant;
                    Rekord: Record "Item Variant";
                begin
                    itscode.Reset();
                    // itscode.SetRange(Code, Rec."ITS Code");
                    // itscode.SetRange("Vendor No.", Rec."Buy-from Vendor No.");
                    // if itscode.FindFirst() then begin
                    if itscode.Get(Rec."Buy-from Vendor No.", Rec."ITS Code") then begin
                        
                        Rekord.SETRANGE(Rekord."Code", Rec."ITS Code");
                        IF Rekord.FindFirst THEN;

                        if not Rekord.IsEmpty then
                            Error(Text001);

                        if not Rekord.Get(Rec."No.", Rec."ITS Code") then begin
                            Rekord.Init;
                            Rekord.Validate("Code", itscode."Code");
                            Rekord.Validate("Item No.", Rec."No.");
                            Rekord.Validate("Description", itscode.Description);
                            Rekord.Insert;

                        end;
                        Rec.Validate("Variant Code", Rekord.Code);
                        Rec.Modify();
                    end;


                end;

            }
        }
    }

    var
        Text001: Label 'Ky variant eshte lidhur njeher me nje artikull.';

        Rekord: Record "Item Variant";



}