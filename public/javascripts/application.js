// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

Event.addBehavior({

    "form.project select.project-standard:change": function(ev) {
        Hobo.ajaxRequest(window.location.href, ['area-menu'], 
                         {params: Form.serializeElements([this]), method: 'get', message: "Filtering list"} )
    }
    
})
