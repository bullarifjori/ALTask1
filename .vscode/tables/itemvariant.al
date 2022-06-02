table 50201 "ItemVariant"
{
    DataClassification = ToBeClassified;
    Caption = 'ItemVariant';
    LookupPageId = "ItemVariantsPage";

    fields
    {
        field(1; "Vendor No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Vendor No.';
            TableRelation = Vendor;
            trigger OnValidate()
            begin
                if "Vendor No." = '' then begin
                    "Vendor Name" := '';
                end
                else begin
                    Vendor.Get("Vendor No.");
                    "Vendor Name" := Vendor."Name";
                end;
            end;

        }
        field(2; "Vendor Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Vendor Name';
            NotBlank = true;
            TableRelation = Vendor;

        }
        field(3; Code; Code[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Code';


        }
        field(4; Description; Text[100])
        {

            Caption = 'Description';

            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(Key1; "Vendor No.", Code)
        {
            Clustered = true;
        }
        key(Key2; "Vendor Name")
        {

        }


    }

    var

        Vendor: Record "Vendor";
        Varianti: Record "Item Variant";

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}