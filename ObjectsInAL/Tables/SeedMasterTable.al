table 50456 "Seed Master"
{
    Caption = 'Seed Master';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Seed Code"; Code[20])
        {
            Caption = 'Seed Code';
            NotBlank = true;
        }
        field(2; "Seed Name"; Text[100])
        {
            Caption = 'Seed Name';
            NotBlank = true;
        }

        field(3; Status; Option)
        {
            Caption = 'Status';
            OptionMembers = Active,Inactive;
            InitValue = Active;
        }
    }

    keys
    {
        key(PK; "Seed Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Seed Code", "Seed Name")
        {

        }
    }
}
