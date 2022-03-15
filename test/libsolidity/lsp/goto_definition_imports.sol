// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.0;

import {Weather as Wetter} from "./lib.sol";
//       ^ @wheatherImportCursor
import "./lib.sol" as That;
//                    ^^^^ @ThatImport

contract C
{
    function test_symbol_alias() public pure returns (Wetter result)
                                             //        ^ @WetterCursor
    {
        result = Wetter.Sunny;
    }

    function test_library_alias() public pure returns (That.Color result)
                                                //     ^ @ThatCursor
    {
        That.Color color = That.Color.Red;
//      ^ @ThatVarCursor   ^ @ThatExpressionCursor
        result = color;
    }
}
// ----
// lib: @diagnostics 2072
// -> textDocument/definition {
//     "position": @wheatherImportCursor
// }
// <- {
//     "result": [
//         {
//             "range": @whetherEnum,
//             "uri": "lib.sol"
//         }
//     ]
// }
// -> textDocument/definition {
//     "position": @WetterCursor
// }
// <- {
//     "result": [
//         {
//             "range": @whetherEnum,
//             "uri": "lib.sol"
//         }
//     ]
// }
// -> textDocument/definition {
//     "position": @ThatCursor
// }
// <- {
//     "result": [
//         {
//             "range": @ColorEnum,
//             "uri": "lib.sol"
//         }
//     ]
// }
// -> textDocument/definition {
//     "position": @ThatVarCursor
// }
// <- {
//     "result": [
//         {
//             "range": @ColorEnum,
//             "uri": "lib.sol"
//         }
//     ]
// }
// -> textDocument/definition {
//     "position": @ThatExpressionCursor
// }
// <- {
//     "result": [
//         {
//             "range": @ThatImport,
//             "uri": "goto_definition_imports.sol"
//         }
//     ]
// }
