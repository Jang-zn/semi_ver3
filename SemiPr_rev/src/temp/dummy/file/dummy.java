package temp.dummy.file;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

public class dummy {

	public static void main(String[] args) {
		FileInputStream fis=null;
		FileOutputStream fos = null;
		
		try {
			 //파일 읽어올 경로 지정해줘야됩니다. board / excList / gallary / menuList 4개 폴더에 각각 이미지파일 아무거나 넣으세요
			 //경로는 폴더 우클릭해서 프로퍼티 보면 나옵니다
			 //번거로워서 메소드 한개만 넣어놨으니 경로 / 파일명 각각 수정해서 쓰면 됩니다
			 //board에는 bfile1.png~ / excList에는 efile1.png~ / gallary에는 gfile1.png~ / menuList에는 mfile1.png~ 로 들어갑니다.
			
			
			 fis = new FileInputStream("C:/Users/Jang/git/semi_ver3/SemiPr_rev/web/upload/gallary/gfile1.png");
			 int data=-1;
			 
			 //i 범위는 더미 데이터셋에서 desc로 정렬해서 확인하시고 본인이 넣은 파일명 참고해서 넣어주세요
			 for(int i=4;i<=1530;i++) {
				 
				 //경로 및 파일명 수정해서 쓰면 됩니다
				 String path = "C:/Users/Jang/git/semi_ver3/SemiPr_rev/web/upload/gallary/";
				 String name = "gfile"+i+".png";
				 
				 
				 File f = new File(path+name);
				 f.createNewFile();
				 fos = new FileOutputStream(f);
				 while((data=fis.read())!=-1) {
					 fos.write(data);
				 }
			 }
		}catch(Exception e) {
			
		}finally {
			try {
				fis.close();
				fos.close();
				System.out.println("완료");
			}catch(Exception e) {
				
			}
		}
		
		

	}

}
