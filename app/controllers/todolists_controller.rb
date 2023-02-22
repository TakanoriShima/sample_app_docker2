class TodolistsController < ApplicationController
  def new
      # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
      @list = List.new
  end
  def create
    @list = List.new(list_params)
    if @list.save
      # flashというハッシュに :notice をいうキーで '投稿が完了しました！' という文字列の値を保存
      flash[:notice] = '投稿が完了しました！'
      redirect_to todolist_path(@list.id)
    else
      render :new
    end
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end
  
  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
    redirect_to todolist_path(@list.id)
    else
      render :edit
    end
  end

  def destroy
    # ---- ここからコードを書きましょう ---- #
    list = List.find(params[:id])  # データ（レコード）を1件取得
    list.destroy  # データ（レコード）を削除
    redirect_to todolists_path  # 投稿一覧画面へリダイレクト
    # ---- ここまでのあいだにコードを書きましょう ---- #
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
  # ---- ここまでのあいだにコードを書きましょう ---- #  
end
