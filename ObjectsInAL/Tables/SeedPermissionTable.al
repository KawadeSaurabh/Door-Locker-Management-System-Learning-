table 50460 "Seed Permission Demo"
{
    Caption = 'Seed Permission Demo';
    DataClassification = CustomerContent;
    Permissions = tabledata "Seed Master" = R;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(2; "Description"; Text[100])
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}