require 'sinatra'


get '/' do
  erb :index
end

post '/form-echo' do
  erb :form_echo
end

__END__

@@ layout
<!DOCTYPE html>
<html>
<head>
  <title>Form Echo</title>
  <style>

  body {font-family: sans-serif;}
  li {margin: 20px;}
  .button {float:right;}
  fieldset {width:30%;}
  table {
    border: 1px solid black; 
    width:80%;
    }
  td{
       border: 1px solid black; 
       padding: 20px;
       margin: 10px;
  }



  </style>


</head>
<body>

  <div class="page">
    <%= yield%>
  </div>


</body>
</html>

@@ index
<h1> Example Form</h1>

<p> Enter anything in this form and click the 
send button to see the field names and values 
echoed to your browser. Look at this page source 
to see where to POST your form to echo its contents.</p>

<form action= "http://form-echo.herokuapps.com/form-echo", method = "post">
  <fieldset>
    <ol>
      <li>
        <label for = "name"> Name: </label><br />
        <input type = "text", name ="name"></input>
        </li>
      <li>
        <label for = "mail"> Email: </label><br />
        <input type = "text", name ="mail"></input>
      <li>
        <label for = "body"> Message: </label><br />
        <textarea name = "body"></textarea>
        </li>
        </ol>
    <input class="button" type = "submit", value = "Send"></input>
  </fieldset>

</form>


@@ form_echo
<h1> Form fields from the params hash:</h1>

<table>
  <tr>
    <th>Key</th>
    <th>Value</th>
  </tr>
  <% params.each do |key,value| %>
    <tr>
      <td style ="text-align:right; background-color: lightgray;">
        <%= key.to_s %>
      </td>
      <td>
        <%= value.to_s %>
      </td>
    </tr>
  <% end %>

</table>






