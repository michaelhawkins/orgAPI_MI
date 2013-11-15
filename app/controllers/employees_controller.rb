class EmployeesController < ApplicationController
  def new
      @employee = Employee.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @employee }
      end

  end

  def update
    @employee = Employee.find(params[:id])

    respond_to do |format|
      if @employee.update_attributes(params[:employee])
        #@employee.organization_ids.push("5283bf3cbf09a5dfd6000002")
        #@employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end    
  end

  def index
    @employees = Employee.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @employees }
    end    
  end

  def show
    @employee = Employee.find(params[:id])

    respond_to do |format|
        format.html # show.html.erb
        format.xml  { render xml: @employee }
        #format.json { render json: @employee.to_json(:include => :organizations) }
        format.json { render json: @employee }
    end    
  end

  def create
    @employee = Employee.new(params[:employee])
    logger.debug "Create employee: #{@employee.attributes.inspect}"

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render json: @employee, status: :created, location: @employee }
      else
        format.html { render action: "new" }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end

  end

  def destroy
    @employee = Employee.find(params[:id])

    @employee.destroy

    respond_to do |format|
      format.html { redirect_to employees_url }
      format.json { head :no_content }
    end    
  end
end
