package helper;

public class Factory <T>{

    private Class<T> mClass;

    public Factory(Class<T> cls){
        mClass = cls;
    }

    public T get(){
        try{
            return mClass.newInstance();
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
}
