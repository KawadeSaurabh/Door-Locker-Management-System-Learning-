codeunit 50450 "Seed Permission Demo"
{
    Permissions = tabledata "Seed Master" = R;
    procedure ReadSeed()
    var
        Seed: Record "Seed Master";
    begin
        if Seed.FindFirst() then
            Message('Seed found: %1', Seed."Seed Name")
        else
            Message('No seed record found.');
    end;
}