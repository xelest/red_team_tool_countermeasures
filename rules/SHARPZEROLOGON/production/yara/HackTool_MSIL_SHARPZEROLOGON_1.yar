// Copyright 2020 by FireEye, Inc.
// You may not use this file except in compliance with the license. The license should have been received with this file. You may obtain a copy of the license at:
// https://github.com/fireeye/red_team_tool_countermeasures/blob/master/LICENSE.txt
rule HackTool_MSIL_SHARPZEROLOGON_1
{
    meta:
        description = "The TypeLibGUID present in a .NET binary maps directly to the ProjectGuid found in the '.csproj' file of a .NET project. This rule looks for .NET PE files that contain the ProjectGuid found in the public 'sharpzerologon' project."
        md5 = "dd8805d0e470e59b829d98397507d8c2"
        rev = 3
        author = "FireEye"
    strings:
        $typelibguid0 = "15ce9a3c-4609-4184-87b2-e29fc5e2b770" ascii nocase wide
    condition:
        (uint16(0) == 0x5A4D and uint32(uint32(0x3C)) == 0x00004550) and any of them
}