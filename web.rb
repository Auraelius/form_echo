require 'sinatra'

get '/' do
  haml :index
end

post '/form-echo' do
  haml :form-echo
end

__END__

@@ layout
%html
  = yield

@@ index
%div.title Example Form:

  %p Enter anything in this form and click the 
  send button to see the field names and values 
  echoed to your browser. Look at this page source 
  to see where to POST your form to echo its contents.
  
  %form{ :action => "http://form-echo.herokuapp.com/form-echo", :method => "post"}
    %fieldset
      %ol
        %li
          %label{:for => "name"} Name:
          %input{:type => "text", :name => "name", :class => "text"}
        %li
          %label{:for => "mail"} email:
          %input{:type => "text", :name => "mail", :class => "text"}
        %li
          %label{:for => "body"} Message:
          %textarea{:name => "body"}
      %input{:type => "submit", :value => "Send", :class => "button"}


@@ form-echo
%div.title Form fields (names and values):
