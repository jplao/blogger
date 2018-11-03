require 'rails_helper'

describe 'user deletes an article' do
  describe 'they think from the show page' do
    it 'displays all articles without the deleted entry' do
      article_1 = Article.create(title: 'Article 1', body: 'Body for Article 1')
      article_2 = Article.create(title: 'Article 2', body: 'Body for Article 2')

      visit article_path(article_1)

      click_link 'Delete'

      expect(current_path).to eq(articles_path)
      expect(page).not_to have_link(article_1.title)
      expect(page).to have_link(article_2.title)
    end
  end
end
