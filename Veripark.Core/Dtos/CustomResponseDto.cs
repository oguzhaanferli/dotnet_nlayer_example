namespace Veripark.Core.Dtos
{
    public class CustomResponseDto<T>
    {
        public T Data { get; set; }
        public bool Status { get; set; }
        public string Messages { get; set; }

        public static CustomResponseDto<T> Success(T data)
        {
            return new CustomResponseDto<T>() { Data = data, Status = true };
        }

        public static CustomResponseDto<T> Fail(string messages)
        {
            return new CustomResponseDto<T>() { Status = false, Messages = messages };
        }
    }
}
