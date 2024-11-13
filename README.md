# PLT Programming Assignment 2 - Parser
Addison Goodwin, ag4423

## Context-free Grammar & Production Rules

program 				-> statement_list
statement_list 			-> statement statement_list | ε

statement				-> character_block | scene_block | instruction

character_block			-> TOK_CHARACTERS TOK_IDENTIFIER character_definition
scene_block				-> TOK_SCENES new_scene |  ε
instruction				-> TOK_WRITE_STORY_INST | TOK_PRINT_CHARACTER_INST

character_definition	-> character_detail | character_definition |  ε
character_detail		-> restricted_assignment | trait_list
restricted_assignment 	-> TOK_EVIL boolean | TOK_STRENGTH TOK_EQUALS TOK_NUMBER

trait_list				-> TOK_TRAIT TOK_EQUALS trait_assignment_t
trait_assignment_t		-> TOK_IDENTIFIER | TOK_COMMA TOK_IDENTIFIER trait_assignment_t | ε

new_scene		 		-> TOK_IDENTIFIER scene_definition
scene_definition		-> scene_detail scene_definition | ε
scene_detail			-> location_assignment | characters_present | event_assignment

location_assignment		-> TOK_LOCATION TOK_EQUALS TOK_IDENTIFIER
event_assignment		-> TOK_EVENT TOK_EQUALS TOK_IDENTIFIER
characters_present		-> TOK_IDENTIFIER TOK_EQUALS character_list
character_list			-> TOK_IDENTIFIER character_list_t | ε
character_list_t		-> TOK_COMMA TOK_IDENTIFIER character_list_t | ε

boolean					-> TOK_TRUE | TOK_FALSE

```
		NON-TERMINALS							TERMINALS
----------------------------			----------------------------
program									TOK_CHARACTERS
statement								TOK_IDENTIFIER
statement_list							TOK_SCENES
character_block							TOK_WRITE_STORY_INST
scene_block								TOK_PRINT_CHARACTER_INST
instruction								TOK_EVIL
character_definition					TOK_STRENGTH
new_scene								TOK_TRAIT
trait_list								TOK_LOCATION
boolean									TOK_EVENT
trait_assignment_t						TOK_COMMA
scene_detail							TOK_EQUALS
scene_definition						TOK_NUMBER
location_assignment
characters_present
event_assignment
character_list
character_list_t
```

## lexer.py Patch Notes
1. Corrected a typo so that `TOK_CHARACTERS` is correctly tokenized.
Previously the token was `TOK_CHARACTER`, but this failed to correctly tokenize into the `TOK_CHARACTERS` token meant to specify the start of the character definition block.

2. Removed print statements used for clarity during Part 1 submission but that are not suitable as input into the parser.

3. Removed tokenization of the `=` tokenized as `TOK_EQUALS` during tokenization of the value in `TOK_EVIL`. The value of `TOK_EQUALS` is captured into the token during lexical analysis, so this `=` is only annoying during parsing.

## How to Build and Run