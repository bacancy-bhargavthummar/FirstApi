$(document).ready(function(){
  $('.deleting_element').click(function(){
    article_id = $(this).data('id')
    if (confirm("Are you sure ???")) {
      $.ajax({
        url: "/api/v1/articles/" + article_id ,
        type: 'DELETE',
        headers: {
          'X-CSRF-Token': document.querySelector("meta[name=csrf-token]").content
        },
        data: {
            article_id: article_id
        },
        success: function(data){
          if (data.status == 'done') {
            $('#deleting_element_' + article_id).parent().parent().remove();
          } else {
            alert(data.message)
          }
        },
        error: function(){
          alert("Something went wrong")
        },
      });
    };
  });
})