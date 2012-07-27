# Cirro
### This will always be in progress.
This is supposed to cover as many code syntax and scenarios that might come up whilst writing code for/with Cirro.
Many ideas and structures were borrowed(stolen) from other people including [jbarnette](https://github.com/jbarnette), [jQuery Core Style Guidelines](http://docs.jquery.com/JQuery_Core_Style_Guidelines) as well as seeing other people do awesome and stupid things.

# The Laws
* Follow the guidelines consistently. If you see code that doesn't, fix it.
* Use your brain. Ignore the guidelines when appropriate...but not unilaterally.
* Obsess about this stuff. Make it damn near impossible to figure out who wrote any given line of code without source control.

# Globals
### These ideas apply to all languages.
* Wrap at 80 col/chars (deal with it).
* Use two real spaces rather than tab(\t)
* Use vertical white space liberally but only one line at a time.
* Use `===` rather than `==`.
* **Commenting**
  * In block comments, full sentences and proper grammar/punctuation.
  * Inline comments need only be as long as required for clarity.
  * Verbosity is preferred. Someone should be able to read through your code once and fully understand it.
* **Variables**
  * Declare all variables at TOP.
  * Variable names should be as long as needed to fully describe their function.


# PHP

### Comments
* Reference [Drupal Doxygen](http://drupal.org/node/1354)
* Use of Doxygen @param and @return minimum required, @see encouraged.
* Page Calbacks must have the @see for the module hook_menu function that calls the page callback.  Also, the immediate description must be prefixed by "Page Callback:" as shown below.
```php
/**
 * Page Callback: Description of what the page callback does.
 * 
 * Additional description goes here if needed and can run more than
 * one line.
 *
 * @param $arg1
 *   Declare arguments just like any other function.
 *
 * @return
 *   Describe the return just like any other function.
 *
 * @see module_menu().
 */
```

### Variable names should always include underscores rather than camelCode.

### Ifs
* If statements should always be in block format with curlies and spacing structure as below. **No exceptions**
```php
if ( x === y ) {

  // ...

}
```
* Only use a Ternary Operator when it is an actual boolean If/Else AND it fits within the 80 col wrap.
* When the number of evaluations causes a wrap, stack and indent appropriately.
```
if (
  eval1 &&
  eval2 &&
  eval3 &&
  ( eval4a || eval4b )
) {

  // ...

}
```
  _Nested ifs may be preferred in this scenario._
* If/Else statements should also be in block format.
```php
// Evaluation description
if ( $a === $b ) {
  
  // Action description
  // ...

} else {

  // Reiterate else relative to evaluation

  // Else action description
  // ...

}
```

### Loops
* Loops are similar to Ifs and their block format while tweaking as necessary by syntax.
```php
foreach ( $array as $key => $value ) {

  // ...

}
```

### EntityFieldQuery
```php
$query = new EntityFieldQuery;
$result = $query
  ->entityCondition('entity_type', $type)
  ->otherMethod($var1, $var2)
  ->execute();
```

### Direct Query
```php
// Query description
$query_string = 'SELECT field FROM {table} WHERE arg= :arg';
$query = db_query($query_string, array(':arg' => $arg));
$result = $query->fetchAll();

// Query descriptions
$query_string = '
  SELECT feild1, field2
  FROM {table}
  WHERE arg1= :arg1
  AND arg2= :arg2
';
$args = array(
  ':arg1' => $arg1,
  ':arg2' => $arg2,
);
$query = db_query($query_string, $args);
$result = $query->fetchAll();
```

### Quotes/Strings
Never use double quotes unless there is a variable within the string.
Always use double quotes with escaped characters as needed when including variables.
    Avoid concatenation at all costs.
#### Eh
```php
'This string is' . $emotion . ' and it is mine.';
```
#### Better
```php
"This string is $emotion and it is mine.";
```

### Building HTML
Think of building your HTML from the inside outward. **NEVER** separate opening and closing tags across PHP sections.
#### Eh
```php
// Init
$html = '';
$content = 'Content';

// Open wrapper
$html .= '<div class="wrapper">';

// Add content
$html .= $content;

// Close wrapper
$html .= '</div>';
```
#### Better
```php
// Init
$html = '';
$wrapper = '';
$content = 'Content';

// Build wrapper
$wrapper = "
  <div class=\\"wrapper\\">
    $content
  </div>
";

// Add wrapped content to html
$html .= $wrapper;
```

# JS/jQuery
All variable names are camelCode with no punctuation.
Declare all variables individually at TOP.
Plugin filenames should be prefixed by 'jquery.'.

# HTML
Anonymous divs are not allowed. Give it some sort of Class or ID even if they won't be used.

Auto Focus on Fields
To autofocus a field add the following attribute to an input element
```
autofocus="autofocus"
```


# SASS
Section Comments
```
// Section Name
//------------------------------------------------------------------------------
```
  Sub sections are marked with simple inline comments like PHP.
Custom changes are always written in _cirro.sass
