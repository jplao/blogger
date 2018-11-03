require 'rails_helper'

describe 'user edits an article' do
  describe 'they link from the articles show' do
    it 'edits an existing article' do
      article = Article.create(title: "Article_1", body: "Body for article 1")
      new_body = "New body for edited article"

      visit article_path(article)

      click_link "Edit"

      fill_in "article[body]", with: new_body

      click_on "Update Article"

      expect(current_path).to eq(article_path(article))
      expect(page).to have_content(new_body)
    end
  end
end
