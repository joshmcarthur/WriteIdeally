/*
Copyright (c) 2003-2010, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config )
{
  config.PreserveSessionOnFileBrowser = true;
  // Define changes to default configuration here. For example:
  config.language = 'en';
  //config.uiColor = '#2c2825';
  config.skin = 'chris';

  //config.ContextMenu = ['Generic','Anchor','Flash','Select','Textarea','Checkbox','Radio','TextField','HiddenField','ImageButton','Button','BulletedList','NumberedList','Table','Form'] ;

  config.height = '400px';
  config.width = '600px';

  //config.resize_enabled = false;
  //config.resize_maxHeight = 2000;
  //config.resize_maxWidth = 750;

  //config.startupFocus = true;

  config.toolbar = 'Basic';

  config.toolbar_Easy =
    [
        ['Source','-','Preview','Templates'],
        ['Cut','Copy','Paste','PasteText','PasteFromWord',],
        ['Maximize','-','About'],
        ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
        ['Styles','Format'],
        ['Bold','Italic','Underline','Strike','-','Subscript','Superscript', 'TextColor'],
        ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
        ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
        ['Link','Unlink','Anchor'],
        ['Image','Embed','Flash','Attachment','Table','HorizontalRule','Smiley','SpecialChar','PageBreak']
    ];
  config.toolbar_Basic =
  [
    ['Cut', 'Copy', 'PasteFromWord', 'PasteText'],
    ['Undo', 'Redo', 'Find', 'Replace'],
    ['Format', 'RemoveFormat'],
    ['Bold', 'Italic', 'Underline', 'TextColor'],
    ['NumberedList', 'BulletedList', 'Outdent', 'Indenet', 'Blockquote'],
    ['Link', 'Unlink']
  ];
};

