class BlogsController < ApplicationController
  before_action :set_blog, only: [:edit, :update ,:destroy]
  
    
    #一覧画面表示
    def index
       @blogs=Blog.all.order(id: :asc)
    end
    
    #新規画面表示
    def new 
    
        if params[:back]
          @blog = Blog.new(blog_params)
          
        else
          @blog=Blog.new
          
        end
    
    end
    
    
    #更新画面表示
    def edit
    end
    
    #閲覧だけの画面は不要？
    
    
    #確認画面表示
    def confirm
        @blog = Blog.new(blog_params)
        render 'new' if @blog.invalid?
    end
    
    
    #新規登録処理
    def create
        
        @blog=Blog.create(blog_params)
        if @blog.save==true
        
            redirect_to blogs_path, notice: "ブログを作成しました。"
            
        else
            render("new")
        end
    
    end
    
    #更新時処理
    def update
        
        if @blog.update(blog_params)==true
            
            redirect_to blogs_path, notice: "ブログを編集しました。"
        
        else
            
            render 'edit'
        end
    end
    
    #削除時処理
    def destroy
        @blog.destroy
        redirect_to blogs_path,notice:"ブログを削除しました"
        
    end
    
    
    private
    
    
    def blog_params
        params.require(:blog).permit(:title,:content)
    end
    
    def set_blog
        @blog = Blog.find(params[:id])
    end

    
end
