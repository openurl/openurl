# openurl

## DESCRIPTION

openurl is a Ruby library creating, parsing and using NISO Z39.88 OpenURLs over 
HTTP. <http://openurl.info/registry>

While openurl can send requests to OpenURL 1.0 resolvers, there is no 'standard'
response format, so parsing the returned value is up to you.

## USAGE
  
    require 'openurl'    
  
    # Create your context object
    context_object = OpenURL::ContextObject.new
  
    # Add metadata to the Context Object Entities
    context_object.referent.set_format('journal')
    context_object.referent.add_identifier('info:doi/10.1016/j.ipm.2005.03.024')
    context_object.referent.set_metadata('issn', '0306-4573')
    context_object.referent.set_metadata('aulast', 'Bollen')
    context_object.referrer.add_identifier('info:sid/google')
    
    puts context_object.kev  
  
    puts context_object.xml  
    
    # Send the context object to an OpenURL link resolver
    transport = OpenURL::Transport.new('http://demo.exlibrisgroup.com:9003/lr_3', context_object)
    transport.get
    puts tranport.response
    
    # Create a new ContextObject from an existing kev or XML serialization:
    #
    # ContextObject.new_from_kev(   kev_context_object )
    # ContextObject.new_from_xml(   xml_context_object ) # Can be String or REXML::Document

## Ruby 1.9 and encodings

Gem is currently developed under 1.9.3, although it should work under 1.8.7.
There is some limited support for handling character encodings in the
proper ruby 1.9 way.

### load_from_kev, load_from_form_vars

When using ContextObject#load_from_kev or #load_from_form_vars, input
will be assumed to be UTF8, unless a ctx_enc value is present specifying 
ISO-8859-1.  The actual ruby #encoding of the input string/stream is ignored,
data will be force_encoded on read. If input is specified ISO-8859-1 with 
ctx_enc data _will_ be _transcoded_ to UTF8 on read. 

Any illegal bytes for the input character encoding _will_ be replaced by
the unicode replacement symbol ("\uFFFD") on read.

### load_from_xml

Input will be assumed UTF8, and force_encoded to UTF8. Illegal bytes in input 
for UTF8 will be replaced by unicode replacement char ("\uFFFD"). 

### Programmatic creation of context objects

Programmatically created context objects, you must ensure all strings are
represented and tagged as utf8 encoded yourself, no detection or trascoding
or correction will be done for you. 


## INSTALLATION

You should be able to install the gem:

    gem install openurl

The source lives in git on github:

    http://github.com/openurl/openurl

## TESTS

There are some automated tests. Run with `rake test`. They live in `./test`
and use Test::Unit.
