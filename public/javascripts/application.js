// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

//jQuery document load event - add cascading event bindings to this function
$.fn.qtip.styles.writeideally = {
    width: 350,
    background: '#d99e9a',
    padding: 10,
    color: '#000',
    fontFamily: 'GentiumBasicRegular',
    textAlign: 'center',
    border: { width: 7, radius: 5, color: '#666'},
    name: 'cream'
}

$(document).ready(function()
{
    BindSignupQTips();
    BindQTipFormInputs();
    BindQTip();
    BindQTipIdeaTags();
    $('.wrapper').equalHeights();
    $('.show_if_js').show();
    $('body .container .page-area #page-header #header-branding a.home').qtip({
        content: {text: false},
        position: {
            corner: {
                target: 'topMiddle',
                tooltip: 'bottomMiddle'
            }
        },
        style: {
            name: 'green',
            width: '300',
            fontFamily: 'GentiumBasicRegular',
            tip: 'bottomMiddle'
        }
    });
});


function BindQTipIdeaTags()
{
    $('#ideas ul#ideas-list li div.controls a.tags-link').qtip({
        content: "<strong>Tags:</strong>",
        position:
        {
            corner:
            {
                target: 'topMiddle',
                tooltip: 'bottomMiddle'
             }
        },
        style:
        {
            tip: true,
            border: {
                width: 5,
                radius: 5,
                color: '#666'
            },
            name: 'light'
        },
        api:
        {
            onRender: function()
            {
                var the_object = this;
                var the_title = the_object.elements.target.attr('title')
                the_object.elements.target.attr('title', '');
                var the_tags = the_title.split(',');
                var the_list = $("<ul></ul>").addClass('tags');
                for(var tag in the_tags)
                {
                    $("<li>" + the_tags[tag] + "</li>").appendTo(the_list);
                }
                the_object.updateContent(the_list);
             }
          }
      });
}


function BindQTip()
{
    $('.qtip').qtip({
        content: { text:false},
        position: {
            corner: {
                target: 'bottomMiddle',
                tooltip: 'topMiddle'
            }
        },
        style: {
            name: 'writeideally',
            tip: 'topMiddle'
        }
    });
}

function BindSignupQTips()
{
    $("input.signup-qtip").qtip({
        content: { text: false },
        position: {
            corner: {
                target: 'rightMiddle',
                tooltip: 'leftMiddle'
            }
        },
        style: {
            name: 'writeideally',
            tip: 'leftMiddle'
        },
        show: {
            delay: 50,
            when: {
                event: 'focusin'
            }
       },
       hide: {
        when: {
            event: 'focusout'
        }
      }
    });
}

function BindQTipFormInputs()
{
    $("input.qtip-input").prev('label').hide();
    $("input.qtip-input").css('margin-top', '5%');
    $("input.qtip-input").qtip({
        content: { text:false},
        position: {
            corner: {
                target: 'topMiddle',
                tooltip: 'bottomMiddle'
            }
        },
        style: {
            name: 'writeideally',
            tip: 'bottomMiddle'
        },
        show: {
            delay: 50,
            when: {
                event: 'focusin'
            }
       },
       hide: {
        when: {
            event: 'focusout'
        }
      }
    });
}

