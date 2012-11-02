ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    columns do 
        column do
            panel "News in Categories" do
                ul do 
                    Category.last(10).map do |category|
                        li "#{link_to(category.name, admin_category_path(category))} (#{category.articles_count||0})".html_safe
                    end
                end
            end
        end
        column do
            panel "Recent News" do
                ul do 
                    Article.order('id desc').last(10).map do |article|
                        li "#{link_to(article.title, admin_article_path(article))} - #{distance_of_time_in_words_to_now(article.created_at)}".html_safe
                    end
                end
            end
        end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end