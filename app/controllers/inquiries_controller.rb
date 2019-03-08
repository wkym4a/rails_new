class InquiriesController < ApplicationController


#今回は「new」と「create」のみ
#(一覧画面は不要)
  # GET /inquiries/new
  def new
    @inquiry = Inquiry.new
  end
  
  # POST /inquiries
  # POST /inquiries.json
  def create
    @inquiry = Inquiry.create(inquiry_params)
    
    if @inquiry.save == true
      #登録に成功した場合
      redirect_to new_inquiry_path #, notice: "問い合わせ内容を登録しました。"
      
    else
      #登録に失敗した場合
      # 入力フォームを再描画します。
      render "new"
      
    end
    
    
=begin
↓は自動作成されたもの……とりあえず無効化
    @inquiry = Inquiry.new(inquiry_params)

    respond_to do |format|
      if @inquiry.save
        format.html { redirect_to @inquiry, notice: 'Inquiry was successfully created.' }
        format.json { render :show, status: :created, location: @inquiry }
      else
        format.html { render :new }
        format.json { render json: @inquiry.errors, status: :unprocessable_entity }
      end
    end
=end

  end


=begin
  # GET /inquiries
  # GET /inquiries.json
  def index
    @inquiries = Inquiry.all
  end

  # GET /inquiries/1
  # GET /inquiries/1.json
  def show
  end


  # GET /inquiries/1/edit
  def edit
  end

  # PATCH/PUT /inquiries/1
  # PATCH/PUT /inquiries/1.json
  def update
    respond_to do |format|
      if @inquiry.update(inquiry_params)
        format.html { redirect_to @inquiry, notice: 'Inquiry was successfully updated.' }
        format.json { render :show, status: :ok, location: @inquiry }
      else
        format.html { render :edit }
        format.json { render json: @inquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inquiries/1
  # DELETE /inquiries/1.json
  def destroy
    @inquiry.destroy
    respond_to do |format|
      format.html { redirect_to inquiries_url, notice: 'Inquiry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inquiry
      @inquiry = Inquiry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inquiry_params
      params.require(:inquiry).permit(:name, :email, :content)
    end

=end

private

  def inquiry_params
    params.require(:inquiry).permit(:name,:email,:content)
  end
  
  def set_inquiry
    @inquiry =Inquiry.find(params[:id])
  end

end
